require 'spec_helper'
require 'carrierwave/test/matchers'

describe ComicStrip do
  include CarrierWave::Test::Matchers
  context "associations" do
    it { should belong_to(:comic) }
  end

  context "validations" do
    it { should validate_presence_of(:comic) }
    it { should validate_presence_of(:comic_image) }
  end

  describe "uploader" do
    let(:cache_id) { "20110226-2116-27023-6024" }
    let(:comic) { Fabricate(:comic) }
    let(:comic_strip) { ComicStrip.new(comic_id: comic) }
    let(:comic_strip_uploader) { ComicStripUploader.new(comic_strip, :comic_strip) }
    let(:comic_tmp_path) { "tmp/uploads/#{cache_id}/nanobots.png" }
    let(:comic_url) { "http://imgs.xkcd.com/comics/nanobots.png" }

    before do
      CarrierWave.stub!(:generate_cache_id).and_return(cache_id)
    end

    it "accepts remote comic strip files" do
      comic_strip.remote_comic_image_url = comic_url
      comic_strip.comic_image.url.should include(comic_tmp_path)
    end

    it "stores remote comic strip files" do
      comic_strip.remote_comic_image_url = comic_url
      expect {
        comic_strip.save
      }.to_not raise_error
    end

    context "bad image url" do
      let(:missing_comic_url) { "http://imgs.xkcd.com/comics/itsmissing.png" }
      let(:bad_comic_url) { "http://xkcd.com/rss.xml" }

      it "raises exception on bad comic url" do
        expect {
          comic_strip.remote_comic_image_url = bad_comic_url
        }.to raise_exception(CarrierWave::IntegrityError)
      end

      it "raises error on missing image url" do
        expect {
          comic_strip.remote_comic_image_url = missing_comic_url
        }.to raise_exception(OpenURI::HTTPError)
      end
    end
  end

  describe "#md5_hash" do
    let(:comic_strip) { Fabricate.build(:comic_strip, :comic_image => nil) }

    context "when it has been persisted to the database" do
      before { comic_strip.update_attribute(:md5_hash, 'a hash!') }
      it "returns the persisted value" do
        comic_strip.md5_hash.should == 'a hash!'
      end
    end

    context "when there is no value in the database" do
      it "creates a new hash" do
        comic_strip.comic_image = File.open(Rails.root.join("spec", "fixtures", "xkcd.png"))
        comic_strip.save
        comic_strip.reload.md5_hash.should == "f4aec7009a0f7f91d24cd187d61ad476"
      end
    end
  end
end
