require 'bundler/setup'
require 'omniauth-discord'
require './app.rb'

use Rack::Session::Cookie, secret: '123456789'

use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_ID'], scope: ENV['SCOPE']
end

run Sinatra::Application
