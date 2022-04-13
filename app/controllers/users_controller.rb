class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:profile]
    def home
        @posts = Post.all.order("created_at ASC")
    end

    def profile
        # user profile 
        @post = @user.posts.all.order("created_at ASC")
    end

    def set_user
        @user = User.find(params[:id]) or not_found
    end

    def suggestion
    end

    def search
        if params[:search].blank?  
            redirect_to(dashboard_path, alert: "Empty field!") and return  
        else  
        @parameter = params[:search].downcase  
        @results = Post.all.where("lower(category) LIKE :search", search: "%#{@parameter}%")  
        end  
    end
    
end
