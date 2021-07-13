class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
        
     if @user && @user.authenticate(params[:user][:password])
        flash[:message] = "login successful"
        session[:user_id] = @user.id
        redirect_to mixtapes_path

     else
        flash[:message] = "login not good"
        @user = User.new
        render :new
     end
  end

  def login
  end

  def welcome
    
  end
end
