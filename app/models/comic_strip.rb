class ComicStrip < ActiveRecord::Base
  belongs_to :comic

  attr_accessible :comic_id, :remote_comic_image_url

  mount_uploader :comic_image, ComicImageUploader

  validates :comic, presence: true
  validates :comic_image, presence: true
  validates :remote_comic_image_url,
    uri: {
      format: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix,
      allow_blank: true
    }

  def md5_hash
    read_attribute(:md5_hash) || generate_md5!
  end

  def generate_md5!
    save! if new_record?

    hash = Digest::MD5.hexdigest(File.read(comic_image.current_path))
    update_attribute(:md5_hash, hash)

    hash
  end
end
