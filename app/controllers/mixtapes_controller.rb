class MixtapesController < ApplicationController
    before_action :redirect_if_not_logged, only: [:new, :create, :edit, :update, :index, :home, :logout]

    before_action :mixtape_true_creator,:no_go, only: [:edit, :update]

    helper_method :current_user, :logged_in?, :logged_out?, :redirect_if_not_logged, :redirect_if_logged, :mixtape_true_creator, :not_mixtape_true_creator, :no_go, :not_user_opinion, :true_user_opinion, :tape_Opinion_count, :the_mixtape, :the_opinion, :the_user


    def index
        @mixtapes = Mixtape.includes(:user)
        #@mixtapes = Mixtape.all
        current_user
        #@current_user ||= User.find_by_id(session[:user_id]) 
    end
    
    def show
        @mixtape = Mixtape.find_by(id: params[:id])
        #binding.pry
        current_user
    end


    def new

        @mixtape = Mixtape.new(user_id: params[:user_id])
        
    end

    def create

        @mixtape = Mixtape.new(mixtape_params)
        
        #@mixtape = current_user.mixtapes.build(mixtape_params)
        
        if @mixtape.save
            redirect_to user_mixtape_path(current_user, @mixtape)
        else
            flash[:message] = @mixtape.errors.full_messages.to_sentence 
            redirect_to new_user_mixtape_path(current_user)
        end
    
    end
    
    def edit
         
        @mixtape = Mixtape.find_by(id: params[:id])

    end
    
    def update

        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.update(mixtape_params)
        if @mixtape.valid?
            redirect_to user_mixtapes_path
            #above made adjustment with rails magic 
        end

    end

    def destroy

        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.destroy
        redirect_to user_mixtapes_path

    end

    def most_recent
        @mixtapes = Mixtape.most_recent

    end

  
    def search
        @mixtapes = Mixtape.search(params[:title])
    end


    private
    
    def mixtape_params#(*args)
         params.require(:mixtape).permit(:title, :artist, :features, :artcover, :genre, :user_id)
        #params.require(:mixtape).permit(*args)
    end


end
