#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

# path to your application root.
APP_ROOT = File.expand_path('..', __dir__)

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

chdir APP_ROOT do
  # This script is a starting point to setup your application.
  # Add necessary setup steps to this file.

  puts '== Installing dependencies =='
  system! 'gem install bundler --conservative'
  system('bundle check') || system!('bundle install')

  # Install JavaScript dependencies if using Yarn
  # system('bin/yarn')

  # puts "\n== Copying sample files =="
  # unless File.exist?('config/database.yml')
  #   cp 'config/database.yml.sample', 'config/database.yml'
  # end

  puts "\n== Preparing database =="
  system! 'bin/rails db:setup'

  puts "\n== Removing old logs and tempfiles =="
  system! 'bin/rails log:clear tmp:clear'

  puts "\n== Restarting application server =="
  system! 'bin/rails restart'
end