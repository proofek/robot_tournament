require 'rubygems'
require 'sinatra'
require 'robot_tournament/player_upload'
require 'robot_tournament/web_ui/player_upload_handler'
require 'robot_tournament/web_ui/home_page'

set :raise_errors, true if ENV['RACK_ENV'] == 'cucumber'
set :show_exceptions, false

error do
  env['sinatra.error'].message + "\n"
end

post '/players' do
  handler = PlayerUploadHandler.new(request.env["rack.input"].read)
  handler.process
end

get '/' do
  HomePage.new(request.env).render
end
