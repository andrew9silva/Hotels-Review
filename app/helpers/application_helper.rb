module ApplicationHelper

    def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
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
