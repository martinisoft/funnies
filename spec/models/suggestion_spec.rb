require 'spec_helper'

describe Suggestion do

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:website) }
    it { should validate_presence_of(:reason) }
  end

  describe "has state" do
    let(:suggestion) { Fabricate(:suggestion) }
    it "starts as 'open'" do
      suggestion.state.should == "open"
    end

    it "changes to accepted" do
      expect {
        suggestion.accept
      }.to change(suggestion, :state).from("open").to("accepted")
    end

    it "changes to rejected" do
      expect {
        suggestion.reject
      }.to change(suggestion, :state).from("open").to("rejected")
    end

    context "is accepted" do
      before do
        suggestion.accept
      end

      it "can't change to rejected" do
        expect {
          suggestion.reject
        }.to_not change(suggestion, :state).from("accepted").to("rejected")
      end
    end

    context "is rejected" do
      before do
        suggestion.reject
      end

      it "can't change to accepted" do
        expect {
          suggestion.accept
        }.to_not change(suggestion, :state).from("rejected").to("accepted")
      end
    end
  end
end
