require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

configure do
  set :haml, format: :html5
end

get '/' do
  haml :index
end
