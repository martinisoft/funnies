require 'spec_helper'

describe User do

  describe "associations" do
    it { should have_many(:subscriptions) }
    it { should have_many(:comics).through(:subscriptions) }
    it { should have_many(:posts) }
    it { should have_many(:suggestions) }
  end

  describe "validations" do
    let(:user) { Fabricate(:user) }
    subject { user }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "subscriptions" do
    let(:user) { Fabricate(:user) }
    let(:comic) { Fabricate(:comic) }

    it "has no subscribed comics" do
      user.subscriptions.should be_empty
    end

    it "can subscribe to a comic" do
      expect {
        user.subscribe!(comic)
      }.to change(user.subscriptions, :count).by(1)
    end

    it "cannot subscribe to the same comic twice" do
      user.subscribe!(comic)
      expect {
        user.subscribe!(comic)
      }.to_not change(user.subscriptions, :count)
    end

    it "can unsubscribe from a comic" do
      user.subscribe!(comic)
      expect {
        user.unsubscribe!(comic)
      }.to change(user.subscriptions, :count).by(-1)
    end
  end
end
