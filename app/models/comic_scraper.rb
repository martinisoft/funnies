require 'nokogiri'

class ComicScraper
  attr_reader :comic, :logger

  # Public: Creates new ComicScraper object from a comic object and optional
  # logger object for errors
  #
  # comic - A Comic object
  # logger - A Rails logger object
  #
  # Returns a new ComicScraper
  def self.from_comic(comic, logger=nil)
    ComicScraper.new(comic, logger)
  end

  # Public: Creates a new ComicScraper object
  #
  # comic - A Comic object
  # logger - A Rails logger object
  #
  # Creates a new ComicScraper object
  def initialize(comic, logger=nil)
    @comic = comic
    @logger = logger
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
    if self.logger
      logger.error("Exception raised when locating comic URL: #{exception}")
    end
  end

end
