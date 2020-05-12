class HotelsController < ApplicationController

    before_action :require_login, only: [:new, :create]

    def index  
        @hotels = Hotel.all 
    end

    def new
        @hotel = Hotel.new
    end

    def create
        
        @hotel = current_user.hotels.build(hotel_params)

        # @hotel = Hotel.new(hotel_params)
        # @hotel.user_id = current_user.id
        if @hotel.save
            redirect_to hotel_path(@hotel) 
        else
            render :new
        end

    end

    def show
        @hotel = Hotel.find_by_id(params[:id])
    end

    def edit 
        @hotel = Hotel.find_by_id(params[:id])
    end

    def update
        @hotel = Hotel.find_by_id(params[:id])
        if @hotel.update(hotel_params)
            redirect_to hotel_path(@hotel)
        else
            render :edit
        end
    end

    def destroy
        @hotel = Hotel.find(params[:id])
        @hotel.destroy
        redirect_to root_path
    end

    private

    def hotel_params
        params.require(:hotel).permit(:name, :price_level, :amenities, :location_id, :user_id)
    end
end
