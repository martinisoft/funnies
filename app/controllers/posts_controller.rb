class PostsController < ApplicationController
  respond_to :html

  before_filter :authenticated, except: :index
  before_filter :authenticate_admin, except: :index

  expose(:posts)
  expose(:post, attributes: :post_params)

  def create
    post.user = current_user
    post.save
    respond_with(post)
  end

  def update
    post.save
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end
end
