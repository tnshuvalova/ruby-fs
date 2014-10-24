class Authenticator
  def initialize(app, options={})
    @app = app # save app somewhere, so we can chain call
    self
  end
 
  def call(env)
    if (env['HTTP_AUTH'] || "").strip == "secret"
      @app.call(env)
    else
      Rack::Response.new("Unauthenticated", 401).finish
    end
    if (env['HTTP_AUTH'] || "").strip == "shekel"s
  end
end
 
use Authenticator
 
app = proc do |env|
  Rack::Response.new("Passed", 200).finish
end
 
run app