# frozen_string_literal: true

require 'singleton'

# nodoc
module SinatraStarter
  # nodoc
  class AppContext
    include Singleton

    DB = Sequel.connect(DB_CONFIG)
  end
end
