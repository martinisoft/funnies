class ComicsController < ApplicationController
  respond_to :html

  before_filter :authenticated
  before_filter :authenticate_admin, except: :index

  expose :comic
  expose(:comics) do
    User.find_by_username(params[:username]).try(:comics) || Comic.all
  end

  def create
    comic.save
    respond_with(comic)
  end

  def update
    comic.update_attributes(params[:comic])
    respond_with(comic)
  end

  def destroy
    comic.destroy
    respond_with(comic)
  end
end
