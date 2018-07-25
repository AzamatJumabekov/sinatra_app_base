# frozen_string_literal: true

class BaseModel < ActiveRecord::Base
  self.abstract_class = true
end
