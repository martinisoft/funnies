require 'spec_helper'

describe PagesController do

  describe "'landing' page" do
    
    it "should be successful" do
      get :landing
      response.should be_successful
    end
  end

  describe "'about' page" do
    
    it "should be successful" do
      get :about
      response.should be_successful
    end
  end
end
