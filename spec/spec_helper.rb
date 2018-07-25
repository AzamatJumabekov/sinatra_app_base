# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'rack/test'
require 'rspec'
require 'faker'
require 'factory_bot'
require 'database_cleaner'
require File.expand_path('../config/boot', __dir__)

abortion_text = 'The App environment is running in production mode!'
abort(abortion_text) if App.env.production?

Dir[App.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods
  config.include Rack::Test::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
