require 'open-uri'

class Comic < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions, source: :user

  validates :name, presence: true
  validates :homepage, presence: true
  validates :comic_page, presence: true
  validates :xpath_title, presence: true, xpath: true
  validates :xpath_image, presence: true, xpath: true

  def latest_comic
    begin
      # Open the URL
      doc = Nokogiri::HTML(open(self.comic_page))
      image_tag = doc.xpath(self.xpath_image)
      if !image_tag.attribute("src").value.match(/^http:\/\//)
        # Needs reformatting
        image_tag.attribute("src").value = "#{self.homepage}/#{image_tag.attribute('src').value}"
      end
      image = image_tag.to_html
      return image if image =~ /img/
    rescue Exception => e
    end
  end
end
