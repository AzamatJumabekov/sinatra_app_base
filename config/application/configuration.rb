# frozen_string_literal: true

require 'singleton'

class AppConfiguration
  include Singleton
  attrs = %i[log_level logger_output]
  attr_accessor(*attrs)
end
