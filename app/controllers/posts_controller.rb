class PostsController < ApplicationController
  respond_to :html

  before_filter :authenticated, except: :index
  before_filter :authenticate_admin, except: :index

  expose :post
  expose(:posts) { Post.all }

  def create
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
end
