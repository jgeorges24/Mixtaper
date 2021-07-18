class SessionsController < ApplicationController
  before_action :redirect_if_not_logged, only: [:destroy]
  
  before_action :redirect_if_logged, only: [:new, :create]
  
  
  
  def new
    
  end

  def destroy
    session.destroy
    #redirect_to  
  end

  def create
    @user = User.find_by(username: params[:user][:username])
        
     if @user && @user.authenticate(params[:user][:password])
        flash[:message] = "login successful"


        session[:user_id] = @user.id
        
        redirect_to user_mixtapes_path(current_user)

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
    
  end



  #SESSIONS CONFIGURATION
  def omniauth
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
        u.email = auth[:info][:email]
        u.username = auth[:info][:email]
        u.name = auth[:info][:name]
        u.uid = auth[:uid]
        u.provider = auth[:provider]
        u.password = SecureRandom.hex(10)
    end
    if @user.valid?
        flash[:message] = "signed in via Google"
        session[:user_id] = @user.id
        redirect_to user_mixtapes_path(current_user)

    else
        flash[:message] = "bad credientials, check again or sign up!"
        redirect_to login_path
    end
end

private

def auth
    request.env['omniauth.auth']
end




end
