require 'plain_spec_helper'

describe ComicScraper do
  describe ".from_comic" do
    let(:comic) { double("comic") }

    subject { ComicScraper.from_comic(comic) }

    it "creates a new ComicScraper with that comic" do
      expect(subject.comic).to eq comic
    end
  end

  describe "#comic_strip_url" do
    let(:comic) { double("comic") }
    let(:scraper) { ComicScraper.from_comic(comic) }
    let(:comic_strip_url) { "http://example.com/xkcd.jpg" }

    let!(:xpath_image) do
      comic.stub(:xpath_image) { "//img[@id='absolute']" }
    end
    let!(:comic_page) do
      comic.stub(:comic_page) { "http://example.com" }
    end

    before do
      scraper.stub :open do
        %{
          <!html>
          <html>
            <head/>
            <body>
              <img id='absolute' src='http://example.com/xkcd.jpg'>
              <img id='relative' src='xkcd.jpg'>
            </body>
          </html>
        }
      end
    end

    context "with a valid image xpath" do
      it "returns a valid comic strip url" do
        expect(scraper.comic_strip_url).to eq comic_strip_url
      end
    end

    context "with an invalid image xpath" do
      let!(:xpath_image) do
        comic.stub(:xpath_image) { "//img[@id='comic']" }
      end

      it "returns nil" do
        expect(scraper.comic_strip_url).to be_nil
      end
    end

    context "when the image url is relative to the website" do
      let!(:xpath_image) do
        comic.stub(:xpath_image) { "//img[@id='relative']" }
      end
      let!(:homepage) do
        comic.stub(:homepage) { "http://example.com" }
      end

      it "reformats the url to be absolute" do
        expect(scraper.comic_strip_url).to eq comic_strip_url
      end
    end

    context "when an exception is raised by Nokogiri" do
      let!(:xpath_image) do
        comic.stub(:xpath_image) { "id(')" }
      end

      before do
        Nokogiri::HTML::Document.should_receive(:parse).and_raise(Nokogiri::SyntaxError)
      end

      it "returns nil" do
        expect(scraper.comic_strip_url).to be_nil
      end
    end

  end
end
