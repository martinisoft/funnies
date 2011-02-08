class ComicsController < ApplicationController
  before_filter :authenticated

  expose(:comic)
  expose(:comics) do
    User.find_by_username(params[:username]).try(:comics) || Comic.all
  end

  def index
  end

  def new
  end

  def create
    comic.save
    redirect_to comics_path, :notice => "Comic added successfully."
  end

  def edit
  end
end
