require 'sinatra'
require "sinatra/reloader"
require 'yaml'

# configure sinatra
set :run, false
set :raise_errors, true

get '/' do
  content_type 'text/html'
  <<-HTML
    <html>
      <body>
        <a href="/auth/discord">Connect to Discord!</a>
      </body>
    </html>
  HTML
end

get '/auth/:provider/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end
