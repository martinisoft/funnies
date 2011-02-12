require 'spec_helper'

describe Comic do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:readers).through(:subscriptions) }
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

  describe "#latest_comic" do
    let(:comic) { Factory(:comic) }
    let(:other_comic) do
      Factory.build(:comic, name: "Real Life Comics",
                            homepage: "http://www.reallifecomics.com/",
                            comic_page: "http://www.reallifecomics.com/",
                            xpath_title: "//div[@class='comic_image']/img/@title",
                            xpath_image: "//div[@class='comic_image']/img")
    end

    context "with a valid image xpath" do
      it "returns a image tag" do
        comic.latest_comic.should include("img")
      end

      it "returns a valid image url" do
        comic.latest_comic.should include("http://")
      end

      it "returns a reformatted image url" do
        other_comic.latest_comic.should include("http://")
      end
    end

    context "with an invalid image xpath" do
      it "returns nil" do
        comic.xpath_image = "id('middleContent')/div[2]/div/div/h1"
        comic.latest_comic.should be_nil
      end
    end
  end
end
