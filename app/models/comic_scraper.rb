require 'spec_helper'

class ComicScraper
  attr_reader :comic

  # Public: Creates new ComicScraper object from a comic object
  #
  # Returns a new ComicScraper
  def self.from_comic(comic)
    ComicScraper.new(comic)
  end

  # Public: Creates a new ComicScraper object
  #
  # comic - A Comic object
  def initialize(comic)
    @comic = comic
  end

  # Public: Fetches the latest comic image url for a comic
  #
  # Returns an absolute url to a comic image, nil otherwise
  def comic_strip_url
    doc = Nokogiri::HTML::Document.parse(open(comic.comic_page))
    image_url = doc.xpath("#{comic.image_xpath}/@src").to_s

    return unless image_url.present?
    unless image_url.match(/\Ahttp:\/\//)
      image_url = "#{comic.homepage}/#{image_url}"
    end

    image_url
  rescue => e
    log_exception("Exception raised when locating comic URL: ", e)

    nil
  end

  private

  def log_exception(message, exception)
    Rails.logger.error("Exception raised when locating comic URL: #{exception}")
  end

end
