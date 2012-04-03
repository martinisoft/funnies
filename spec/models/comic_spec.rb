require 'spec_helper'

describe Comic do
  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:readers).through(:subscriptions) }
    it { should have_many(:comic_strips) }

    describe "comic_strips" do
      let(:comic) { Fabricate(:comic) }
      let(:comic_strip) { Fabricate(:comic_strip, comic: comic) }
      it "destroys all dependent subscriptions" do
        comic.destroy
        ComicStrip.all.should be_empty
      end
    end

    describe "subscriptions" do
      let(:comic) { Fabricate(:comic) }
      let(:user) { Fabricate(:user) }
      let(:subscription) { user.subscribe!(comic) }
      it "destroys all dependent subscriptions" do
        user.destroy
        Subscription.all.should be_empty
      end
    end
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
    let(:comic) { Fabricate(:comic) }
    let(:comic_image_url) { Rails.root.join("spec", "fixtures", "xkcd.png").to_s }
    before { comic.stub source_image_url: comic_image_url }

    context "with a new comic available" do
      let(:comic_strip) { double("ComicStrip").stub(:remote_comic_image_url) }

      before do
        comic.stub_chain(:comic_strips, :create).and_return(comic_strip)
      end

      it "creates a comic strip with a correct url" do
        comic.comic_strips.should_receive(:create).with(remote_comic_image_url: comic_image_url)
        comic.update_strip
      end
    end

    context "without a new comic available" do
      let(:existing_strip) { Fabricate(:comic_strip) }
      before { ComicStrip.stub(find_by_md5_hash: existing_strip) }
      it "does nothing" do
        comic.comic_strips.should_not_receive(:create)
        comic.update_strip
      end
    end

    context "with no source_image_url" do
      let(:other_comic) { Fabricate(:comic) }
      before { other_comic.stub source_image_url: nil }
      it "does not update" do
        other_comic.comic_strips.should_not_receive(:create)
        other_comic.update_strip
      end
    end
  end

  describe "#source_image_url" do
    let(:comic) { Fabricate(:comic, homepage: "http://example.com") }
    before do
      comic.stub :open do
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
      context "and an absoulute image reference" do
        before { comic.xpath_image = "//img[@id='absolute']" }
        it "returns the image url" do
          comic.source_image_url.should eq("http://example.com/xkcd.jpg")
        end
      end

      context "and a relative image reference" do
        before { comic.xpath_image = "//img[@id='relative']" }
        it "reformats the image url" do
          comic.source_image_url.should eq("http://example.com/xkcd.jpg")
        end
      end
    end

    context "with an invalid image xpath" do
      before { comic.xpath_image = "id('middleContent')/div[2]/div/div/h1" }
      it "returns nil" do
        comic.source_image_url.should be_nil
      end
    end
  end
end
