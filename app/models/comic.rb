require 'open-uri'

class Comic < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :readers, through: :subscriptions, source: :user
  has_many :comic_strips, dependent: :destroy

  validates :name, presence: true
  validates :homepage, presence: true
  validates :comic_page, presence: true
  validates :xpath_title, presence: true, xpath: true
  validates :xpath_image, presence: true, xpath: true

  attr_accessible :name, :homepage, :comic_page, :xpath_title, :xpath_image

  def update_strip
    return nil unless source_image_url.present?

    hash = Digest::MD5.hexdigest(open(source_image_url).read)
    unless ComicStrip.find_by_md5_hash(hash)
      comic_strips.create(remote_comic_image_url: source_image_url)
    end
  end

  def source_image_url
    doc = Nokogiri::HTML(open(self.comic_page))
    image_url = doc.xpath("#{xpath_image}/@src").to_s

    return unless image_url.present?
    unless image_url.match(/^http:\/\//)
      image_url = "#{self.homepage}/#{image_url}"
    end

    image_url
  rescue => e
    logger.info "failed to parse image:", e
    nil
  end
end
