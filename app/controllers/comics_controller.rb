class ComicsController < ApplicationController
  before_filter :authenticated

  expose(:comic)
  expose(:comics) do
    User.find_by_username(params[:username]).try(:comics) || Comic.all
  end

  def create
    if comic.save
      flash[:notice] = "Comic added successfully."
      redirect_to comics_path
    else
      redirect_to new_comic_path, alert: "Comic could not be saved"
    end
  end

  def update
    comic.update_attributes(params[:comic])
    redirect_to comics_path, :notice => "Comic updated successfully."
  end

  def destroy
    comic.destroy
    redirect_to comics_path, notice: "Comic deleted successfully!"
  end
end
