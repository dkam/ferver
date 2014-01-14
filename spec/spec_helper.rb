require 'rubygems'
require 'spork'

ENV['RACK_ENV'] = 'test'  # force the environment to 'test'

Spork.prefork do
  require File.join(File.dirname(__FILE__), '..', '/src/', 'http_file_server')

  require 'rubygems'
  require 'sinatra'
  require 'rspec'
  require 'rack/test'
  require 'webrat'

  # test environment stuff
  set :environment, :testf
  set :run, false
  set :raise_errors, true
  set :logging, false

  RSpec.configure do |conf|
    conf.include Rack::Test::Methods
    conf.mock_framework = :mocha
  end

  def app
    @app ||= HttpFileServer
  end
end

Spork.each_run do
end