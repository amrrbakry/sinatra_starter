# frozen_string_literal: true

root = ::File.dirname(__FILE__)

require ::File.join(root, 'app')

run SinatraStarter::App.new
