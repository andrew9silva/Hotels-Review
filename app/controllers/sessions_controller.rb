class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def google_create
      access_token = request.env['omniauth.auth']
      @user = User.find_or_create_from_auth_hash(access_token)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    def create
      @user = User.find_by(username: params[:user][:username])  
      if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
      else
        redirect_to '/login' 
      end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end