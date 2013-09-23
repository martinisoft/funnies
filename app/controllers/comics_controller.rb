class ComicsController < ApplicationController
  respond_to :html
  respond_to :rss, only: :index

  before_filter :authenticate_unless_rss
  before_filter :authenticate_admin, except: :index

  expose(:comic, attributes: :comic_params)
  expose(:comics)
  expose(:subscribed_comics) { User.find_by_username(params[:username]).try(:comics) || [] }

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

  private

  def authenticate_unless_rss
    authenticated unless request.format.to_s[/rss/]
  end
  hide_action :authenticate_unless_rss

  def comic_params
    params.require(:post).permit(:name, :homepage, :comic_page,
                                 :xpath_title, :xpath_image)
  end
end
