require 'sinatra'
require_relative './controller'

module Ferver
  class App < Sinatra::Application
    set :app_file, __FILE__

    configure do
      set :views, './views'
    end

    if Ferver.configuration.username != nil
      use Rack::Auth::Basic, "Ferver!"  do |username, password|
        username == Ferver.configuration.username && password == Ferver.configuration.password
      end 
    end

    use Controller
  end
end
