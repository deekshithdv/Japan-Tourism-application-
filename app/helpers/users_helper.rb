module UsersHelper
    def current_user?
        if @user.id == current_user.id
            return true
        else
            return false
        end
    end
end
