# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  def store_dir
    App.root.join('public', 'uploads').to_s
  end

  def cache_dir
    App.root.join('tmp', 'uploads-cache').to_s
  end
end
