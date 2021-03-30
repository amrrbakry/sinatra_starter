# frozen_string_literal: true

module SinatraStarter
  class App < Sinatra::Application
    set :show_exceptions, :after_handler
  end
end
