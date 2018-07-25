# frozen_string_literal: true

class Env < String
  def production?
    App.env == 'production'
  end

  def development?
    App.env == 'development'
  end

  def test?
    App.env == 'test'
  end
end
