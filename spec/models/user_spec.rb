require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory.build(:user)
  end

  it "should allow valid attributes to save" do
    @user.should be_valid
    @user.save!
  end

  describe "validations" do

    it "should reject a blank username" do
      @user.username = ""
      @user.should_not be_valid
    end

    it "should reject a blank email" do
      @user.email = ""
      @user.should_not be_valid
    end

    it "should reject an improperly formatted email" do
      @user.email = "foo@bar"
      @user.should_not be_valid
    end

    it "should reject a blank password" do
      @user.password = ""
      @user.should_not be_valid
    end

    it "should reject a mis-matched password confirmation" do
      @user.password = "foo"
      @user.password_confirmation = "bar"
      @user.should_not be_valid
    end
  end
end
