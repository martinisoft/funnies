# encoding: utf-8

class ComicImageUploader < CarrierWave::Uploader::Base

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "images/comics/#{model.comic_id}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
