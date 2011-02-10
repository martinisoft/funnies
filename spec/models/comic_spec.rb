require 'spec_helper'

describe Comic do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:readers).through(:subscriptions) }
  end

  describe "validations" do
    it { should validate_presence_of(:xpath_title) }
    it { should validate_presence_of(:xpath_image) }
  end

  describe "#latest_comic" do
    let(:comic) { Factory(:comic) }

    context "with a valid image xpath" do
      it "returns an image tag" do
        comic.latest_comic.should include("img")
      end
    end

    context "without a valid image xpath" do
      it "returns nil" do
        comic.xpath_image = "id('middleContent')/div[2]/div/div/h1"
        comic.latest_comic.should be_nil
      end
    end
  end
end
