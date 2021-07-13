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

  def logout
    session.clear
    redirect_to login_path
end

  def welcome
    #add some stuff to show on the home page other than login and sign up
  end
end
