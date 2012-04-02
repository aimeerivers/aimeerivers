require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml '%h1 hello world'
end
