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

  def update_strip
    scraper = ComicScraper.from_comic(self, Rails.logger)
    comic_strip_url = scraper.comic_strip_url

    return nil unless comic_strip_url.present?

    comic_data = open(comic_strip_url).read
    hash = Digest::MD5.hexdigest(comic_data)
    unless ComicStrip.find_by_md5_hash(hash)
      comic_strips.create(remote_comic_image_url: comic_strip_url)
    end
  end
end
