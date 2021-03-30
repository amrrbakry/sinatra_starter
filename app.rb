# frozen_string_literal: true

require 'sinatra/base'
require './config/initializers/init'
require './error_handlers'
require './app_context'
require './models/init'
require './contracts/init'
require './serializers/init'
require './routes/init'

module SinatraStarter
  class App < Sinatra::Application
    set :default_content_type, 'application/json'
  end
end
