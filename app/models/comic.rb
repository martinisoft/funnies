require 'open-uri'

class Comic < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions, source: :user
  has_many :comic_strips

  validates :name, presence: true
  validates :homepage, presence: true
  validates :comic_page, presence: true
  validates :xpath_title, presence: true, xpath: true
  validates :xpath_image, presence: true, xpath: true

  def update_strip
    if source_image_url.present?
      hash = Digest::MD5.hexdigest(open(source_image_url).read)
      unless ComicStrip.find_by_md5_hash(hash)
        comic_strips.create(:remote_comic_image_url => source_image_url)
      end
    end
  end

  def source_image_url
    begin
      doc = Nokogiri::HTML(open(self.comic_page))
      image_tag = doc.xpath(self.xpath_image)
      image_url = image_tag.attribute("src").value
      unless image_url.match(/^http:\/\//)
        image_url = "#{self.homepage}/#{image_url}"
      end
      image_url
    rescue Exception => e
    end
  end
end
