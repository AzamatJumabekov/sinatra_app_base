# frozen_string_literal: true

require 'sinatra/async'
require 'sinatra/activerecord'
require 'sinatra/param'
require 'json'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::Param

  before do
    content_type :json
  end

  register Sinatra::Async
end
