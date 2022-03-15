# frozen_string_literal: true

# ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative 'database_helper'
# require 'features/web_helpers'

Capybara.app = BookmarkManager

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

RSpec.configure do |config|
  config.before(:each) do
    truncate_test_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mRun: rubocop\e[0m"
  end
end
