class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:profile]
    def home
        @posts = Post.all
    end

    def profile
        # user profile 
        @post = @user.posts.all
    end

    def set_user
        @user = User.find(params[:id])
    end
    
end
