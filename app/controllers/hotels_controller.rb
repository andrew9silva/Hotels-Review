class HotelsController < ApplicationController

    def index  
        @hotels = Hotel.all 
    end

    def new
        @hotel = Hotel.new
    end

    def create
        @hotel = Hotel.new(hotel_params)
        if @hotel.save!
            redirect_to '/hotels/index'
        else
            redirect_to '/users/show'
        end

    end

    def show
        @hotel = Hotel.find_by_id(params[:id])
    end

    private

    def hotel_params
        params.require(:hotel).permit(:name, :price_level, :amenities, :location_id, :user_id)
    end
end
