class ReviewsController < ApplicationController

    #before_action :require_login

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.save!
           redirect_to review_path(@review)
        else
           redirect_to '/reviews/new'
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
end
