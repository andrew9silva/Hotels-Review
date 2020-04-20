module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(id: session[:user_id])
    end

    def locations_hotels
        @location = Location.find_by_id(params[:id])
        @location_hotels = @location.hotels
    end

    # def logged_in?
    #     !!session[:user_id]
    # end

end
