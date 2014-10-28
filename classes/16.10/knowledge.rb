def attribute(variable_desc, &block)
    hash_set = variable_desc.is_a?(Hash)
    if hash_set
        variable = variable_desc.keys[0]
        default_value = variable_desc[variable]
    else
        variable = variable_desc
    end

    define_method("#{variable}") do 
        if !instance_variable_defined? "@#{variable}"
            if hash_set
                return default_value
            end
            if block_given?
                return instance_eval &block
            end
        end
        return instance_variable_get "@#{variable}"
    end

    define_method("#{variable}?") do
        if !instance_variable_defined? "@#{variable}"
            if hash_set
                return default_value
            end
            if block_given?
                return instance_eval &block
            end
        end
        return instance_variable_get "@#{variable}"
    end
    
    define_method("#{variable}=") do |value|
        instance_variable_set "@#{variable}", value
    end
end