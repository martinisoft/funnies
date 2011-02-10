require 'open-uri'

class Comic < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions, source: :user

  validates :xpath_title, presence: true
  validates :xpath_image, presence: true

  def latest_comic
    # Open the URL
    doc = Nokogiri::HTML(open(self.homepage))
    image = doc.xpath(self.xpath_image).to_html
    return image if image =~ /img/
  end
end
