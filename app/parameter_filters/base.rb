# frozen_string_literal: true

class Base
  def self.cleanup(params)
    exclude_not_permitted_params(params)
  end

  def self.exclude_not_permitted_params(params)
    params.select do |key, _value|
      permitted.include?(key.to_sym)
    end.to_h
  end

  def self.permitted
    NotImplemented
  end
end
