# frozen_string_literal: true

require_relative 'configuration'
require_relative 'env'

class App
  APP_ENV = ENV.fetch('RACK_ENV', 'development').downcase.freeze

  def self.env
    Env.new(APP_ENV)
  end

  def self.configure
    yield config
  end

  def self.config
    AppConfiguration.instance
  end

  def self.root
    ROOT_PATH
  end

  def self.init
    require ROOT_PATH.join('config/router')
    require_all Dir.glob('app/config/initializers/*.rb')
  end
end
