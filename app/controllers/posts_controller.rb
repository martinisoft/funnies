class PostsController < ApplicationController
  respond_to :html

  before_filter :authenticated, except: :index
  before_filter :authenticate_admin, except: :index

  expose :post
  expose(:posts) { Post.all }

  def create
    if post.save
      redirect_to posts_path, notice: "Successfully created post!"
    else
      flash[:alert] = "Post could not be saved"
      respond_with(post)
    end
  end

  def update
    if post.save
      redirect_to posts_path, notice: "Successfully updated post!"
    else
      render :edit, alert: "Post could not be saved"
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Successfully deleted post!"
  end
end
