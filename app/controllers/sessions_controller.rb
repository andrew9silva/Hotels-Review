class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
      if params[:username].nil? || params[:username].empty?
       redirect_to :login
      else
       session[:username] = params[:username]
       redirect_to :show
      end
    end
end