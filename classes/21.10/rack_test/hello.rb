require 'sinatra'
require 'mongoid'
require 'json/ext'

configue do
    Mongoid.load!("./mongoid.yml")

get '/disc' do
  `free -m`
end

get '/path' do
  `echo $PATH`
end

get '/memory' do
  "This is #{params[:name]}'s page!"
end

get '/java' do
    `ps -waux | grep java`
end

