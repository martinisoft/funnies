require 'spec_helper'

describe TokensController do
  describe "#create" do
    let(:password) { "foobarbaz" }
    let(:user) do
      Fabricate(:user,
                password: password,
                password_confirmation: password)
    end

    let(:params) do
      { login: user.username, password: login_password }
    end

    before { post :create, params }

    context "with good credentials" do
      let(:login_password) { "foobarbaz" }
      it "responds with a stats code of 200" do
        response.status.should eq(200)
      end
      it "responds with a token" do
        response.body.should include("token")
      end
    end
    context "with bad credentials" do
      let(:login_password) { "letmein" }
      it "responds with a 401 error and message" do
        response.status.should eq(401)
      end
      it "responds with a message" do
        response.body.should include("message")
      end
    end
  end
end
