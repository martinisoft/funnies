require 'spec_helper'

describe Comic do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:readers).through(:subscriptions) }
    it { should have_many(:comic_strips) }
  end

  describe "validations" do
    specify { should validate_presence_of(:name) }
    specify { should validate_presence_of(:homepage) }
    specify { should validate_presence_of(:comic_page) }
    specify { should validate_presence_of(:xpath_title) }
    specify { should validate_presence_of(:xpath_image) }

    specify { should_not allow_value("id(')").for(:xpath_title) }
    specify { should_not allow_value("id(')").for(:xpath_image) }
  end

  describe "#update_strip" do
    let(:comic) { Factory(:comic) }
    let(:comic_image_url) { Rails.root.join("spec", "fixtures", "xkcd.png") }
    before { comic.stub source_image_url: comic_image_url }

    context "with a new comic available" do
      it "creates a comic strip with a correct url" do
        comic.comic_strips.should_receive(:create).with(remote_comic_image_url: comic_image_url)
        comic.update_strip
      end
    end

    context "without a new comic available" do
      let(:existing_strip) { Factory(:comic_strip) }
      before { ComicStrip.stub(find_by_md5_hash: existing_strip) }
      it "does nothing" do
        comic.comic_strips.should_not_receive(:create)
        comic.update_strip
      end
    end

    context "with no source_image_url" do
      let(:other_comic) { Factory(:comic) }
      before { other_comic.stub source_image_url: nil }
      it "does not update" do
        other_comic.comic_strips.should_not_receive(:create)
        other_comic.update_strip
      end
    end
  end

  describe "#source_image_url" do
    let(:comic) { Factory(:comic) }

    context "with a valid image xpath" do
      context "and an absoulute image reference" do
        it "returns the image url" do
          comic.source_image_url.should include("http://")
        end
      end

      context "and a relative image reference" do
        let(:comic) do
          Factory.build(:comic,
                        comic_page: "http://www.reallifecomics.com/",
                        xpath_image: "//div[@class='comic_image']/img")
        end
        it "reformats the image url" do
          comic.source_image_url.should include("http://")
        end
      end
    end

    context "with an invalid image xpath" do
      it "returns nil" do
        comic.xpath_image = "id('middleContent')/div[2]/div/div/h1"
        comic.source_image_url.should be_nil
      end
    end
  end
end
