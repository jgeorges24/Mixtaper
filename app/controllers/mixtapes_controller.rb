class MixtapesController < ApplicationController
    before_action :redirect_if_not_logged, only: [:new, :create, :edit, :update, :index, :home]

    helper_method :current_user, :logged_in?, :logged_out?

    def index
        @mixtapes = Mixtape.includes(:user)
        #@mixtapes = Mixtape.all
        current_user
        # @current_user ||= User.find_by_id(session[:user_id]) 
    end
    
    def show
        @mixtape = Mixtape.find_by(id: params[:id])
    end


    def new

        @mixtape = Mixtape.new
        
    end

    def create
        @mixtape = Mixtape.new(mixtape_params)
        
        #@mixtape = current_user.created_tapes.build(mixtape_params)
        
        if @mixtape.save
            redirect_to mixtape_path(@mixtape)
        else
            flash[:message] = @mixtape.errors.full_messages.to_sentence 
            redirect_to new_mixtape_path
        end
    
    end
    
    def edit
        @mixtape = Mixtape.find_by(id: params[:id])

    end
    
    def update

        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.update(mixtape_params)
        if @mixtape.valid?
            redirect_to @Mixtape
            #above made adjustment with rails magic 
        end

    end

    def destroy

        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.destroy
        redirect_to mixtapes_path

    end

    def most_recent
        @mixtapes = Mixtape.most_recent

    end

  
    def search
        @mixtapes = Mixtape.search(params[:title])
    end


    private
    
    def mixtape_params#(*args)
         params.require(:mixtape).permit(:title, :artist, :features, :artcover, :genre)
        #params.require(:mixtape).permit(*args)
    end


end
