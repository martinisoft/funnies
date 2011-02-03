class SubscriptionsController < ApplicationController

  expose(:comic) { Comic.find(params[:comic_id]) }

  def create
    current_user.subscribe!(comic)
    redirect_to comics_path, :notice => "Subscribed to #{comic.name} successfully!"
  end
end
