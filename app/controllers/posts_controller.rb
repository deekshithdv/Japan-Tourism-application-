class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:success] = "The snozberries taste like snozberries!" 
        redirect_to root_path
      else
        redirect_to new_post_path
      end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
    end
  end
    
  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to root_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :caption, :user_id, :location, :category,:longitude, :latitude, files: [])
  end
end
