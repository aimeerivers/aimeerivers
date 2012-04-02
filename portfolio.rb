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

get '/css/:name.css' do
  content_type 'text/css', charset: 'utf-8'
  scss :"css/#{params[:name]}"
end
