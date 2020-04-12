class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            render 'users/new'
        end
    end

    def home
        @user = User.find_by_id(params[:id])
        unless logged_in?
          redirect_to home_path
        end
      end

    @user = User.find_by_id(params[:id])

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
