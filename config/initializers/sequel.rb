# frozen_string_literal: true

require 'sequel'
require 'yaml'

# nodoc
module SinatraStarter
  DB_CONFIG = YAML.load_file('config/database.yml').fetch(ENV['RACK_ENV'] || 'development')

  Sequel.connect(DB_CONFIG.merge(database: 'postgres')) do |db|
    db_exists = db.execute("SELECT FROM pg_database WHERE datname = '#{DB_CONFIG.fetch(:database)}'")
    db.execute("CREATE DATABASE #{DB_CONFIG.fetch(:database)}") unless db_exists == 1
  end

  Sequel.connect(DB_CONFIG) do |conn|
    Sequel.extension :migration
    Sequel::Migrator.run(conn, 'db/migrations')
  end
end
