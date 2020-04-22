class ReviewsController < ApplicationController

    before_action :get_hotel

    def index
        @reviews = @hotel.reviews
    end

    def new
        @review = @hotel.reviews.build
    end

    def create
        @review = @hotel.reviews.build(review_params)
        @review.user_id = current_user.id
        if @review.save!
           redirect_to hotel_path(@hotel)
        else
           redirect_back(fallback_location: new_hotel_review_path(@hotel))
        end  
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def edit
        @review = Review.find_by_id(params[:id])
    end

    def update
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    private

    def review_params
        params.require(:review).permit(:date_visited, :content)
    end

    def get_hotel
        @hotel = Hotel.find(params[:hotel_id])
    end
end
