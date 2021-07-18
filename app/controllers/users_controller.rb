class UsersController < ApplicationController
    before_action :redirect_if_logged, only: [:new, :create, :show, :index]
    
    skip_before_action :authorized, only: [:new, :create]

    # def index
        
    #     @users = User.all
    # end

    # def show
    #     #must add this route in routes.rb to work
    #     @user = User.find_by(username: params[:user][:username])
    #     @mixtapes = user.mixtape

    # end

    def new
        #comented this out so data is not generated when new signup renders
        @user = User.new

    end

    def create
        
        @user = User.new(user_params)
            if @user.save
                flash[:message] = "user created"
                session[:user_id] = @user.id
                #binding.pry
                redirect_to recent_mixtape_path
            else
                flash[:message] = @user.errors.full_messages.to_sentence
                render :new
            end

    end


    private
    def user_params

        params.require(:user).permit(:name, :username, :password, :email, :user_id)

    end



end
