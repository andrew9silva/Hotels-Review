module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(id: session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
        unless logged_in?
          redirect_to login_path 
        end
      end

end
