class TokensController < ApplicationController
  respond_to :json
  expose(:user) { User.find_by_login(params[:login]) }

  def create
    if user && user.valid_password?(params[:password])
      user.ensure_authentication_token!
      render status: 200, json: { token: user.authentication_token }
    else
      render status: 401, json: { message: "Invalid login or password." }
    end
  end
end
