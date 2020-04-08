class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def google_create
        access_token = request.env['omniauth.auth']
        @user = User.from_omniauth(access_token)
        @user.save
        session[:user_id] = @user.id
      
        redirect_to user_path(@user)
    end

    def create
      @user = User.find_by(params[:username])  
      if @user.authenticate(params[:user][:password])
       session[:username] = @user.id
       redirect_to user_path(@user)
      else
       render 'sessions/new' 
      end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end