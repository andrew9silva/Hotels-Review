class LocationsController < ApplicationController

    #before_action :require_login, only: [:new, :create]

    def index
        @locations = Location.all.ordered_by_name
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        if @location.save!
            redirect_to location_path(@location)
        else
            redirect_to '/locations/new'
        end
    end

    def show
        @location = Location.find_by_id(params[:id])
    end

    private

    def location_params
        params.require(:location).permit(:name) 
    end
end
