# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RSpec::Core::RakeTask.new(:spec)
  RuboCop::RakeTask.new(:rubocop)
rescue LoadError
  # no rspec/rubocop available
end

task default: [:rspec_rubocop]

task :rspec_rubocop do
  Rake::Task['rubocop'].invoke
  Rake::Task['spec'].invoke
end

namespace :db do
  desc 'create database'
  task :create do |_t, _args|
    require './config/initializers/sequel'
  end

  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    require './app_context'

    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel::Migrator.run(SinatraStarter::AppContext::DB, 'db/migrations', target: version)
  end
end
