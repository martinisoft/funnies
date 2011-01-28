class ComicsController < ApplicationController
  expose(:comic)
  expose(:comics) { Comic.all }

  def index
  end

  def new
  end

  def create
    if comic.save
      redirect_to comics_path, :notice => "Comic added successfully."
    end
  end

  def edit
  end
end
