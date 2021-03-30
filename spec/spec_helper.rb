# frozen_string_literal: true

require 'factory_bot'
require 'rack/test'

ENV['APP_ENV'] = 'test'
ENV['RACK_ENV'] = 'test'

require './app'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Rack::Test::Methods

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def app
  SinatraStarter::App
end

def payload
  JSON.parse(last_response.body)
end

module Rack
  module Test
    module Methods
      def build_rack_mock_session
        Rack::MockSession.new(app, 'localhost')
      end
    end
  end
end
