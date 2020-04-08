class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def google_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.username = auth['info']['email']
            u.password = 'password'
            u.password_confirmation = 'password'
          end
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