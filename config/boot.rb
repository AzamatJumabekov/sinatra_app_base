# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'require_all'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

ROOT_PATH = Pathname.new(::File.expand_path('../../', __FILE__)).freeze

require ROOT_PATH.join('config/application/app')
require ROOT_PATH.join("config/environments/#{App.env}")

require_all Dir.glob('app/**/*.rb')

App.init
