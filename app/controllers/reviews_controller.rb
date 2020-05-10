class ReviewsController < ApplicationController

    before_action :get_hotel
    before_action :get_review, except: [:new, :create]
    before_action :require_login, only: [:new, :create]


    def new
        @review = @hotel.reviews.build
    end

    def create
        @review = @hotel.reviews.build(review_params)
        @review.user_id = current_user.id
        if @review.save
           redirect_to hotel_path(@hotel)
        else
            #include a flash error?
           redirect_back(fallback_location: new_hotel_review_path(@hotel))
        end  
    end

    def show
        #@review = Review.find_by_id(params[:id])
    end

    def edit
        @review = Review.find_by_id(params[:id])
    end

    def update
        if current_user.id == @review.user_id
            if @review.update(review_params)
                redirect_to hotel_review_path(@hotel, @review)
            else
                #flash error?
                render :edit
            end
        else
            #include a flash error?
            redirect_back(fallback_location: hotel_path(@hotel))
        end  
        
    end

    def destroy
        if current_user.id == @review.user_id
          @review.delete
          redirect_to hotel_path(@hotel)
        else
          redirect_back(fallback_location: hotel_path(@hotel))
        end
    end


    private

    def review_params
        params.require(:review).permit(:date_visited, :content)
    end

    def get_hotel
        @hotel = Hotel.find(params[:hotel_id])
    end
    def get_review
        @review = Review.find(params[:id])
    end
end
