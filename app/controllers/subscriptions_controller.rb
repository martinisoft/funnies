class SubscriptionsController < ApplicationController

  expose(:comic) { Comic.find(params[:comic_id]) }

  def create
    current_user.subscribe!(comic)
    redirect_to comics_path, :notice => "Subscribed to #{comic.name} successfully!"
  end

  def destroy
    current_user.unsubscribe!(comic)
    redirect_to comics_path, :notice => "Unsubscribed from #{comic.name} successfully!"
  end
end
