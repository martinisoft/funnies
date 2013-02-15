require 'spec_helper'

describe PagesController do
  render_views

  describe "#landing" do

    it "renders the landing page" do
      get :landing
      expect(response).to render_template("landing")
    end

  end

  describe "#about" do

    it "renders the about page" do
      get :about
      expect(response).to render_template("about")
    end

  end

  describe "#copyright" do

    it "renders the copyright page" do
      get :copyright
      expect(response).to render_template("copyright")
    end

  end

end
