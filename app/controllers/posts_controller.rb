class PostsController < ApplicationController
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

  def show
    @post = Post.find(params[:id])
  end
    
    def post_params
        params.require(:post).permit(:title, :caption, :user_id, :location, :category, files: [])
    end
end
