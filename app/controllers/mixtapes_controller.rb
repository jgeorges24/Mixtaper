class MixtapesController < ApplicationController
    
    def index
        #@mixtapes = Mixtape.includes(:user)
        @mixtapes = Mixtape.all
    end
    
    def show
        @mixtape = Mixtape.find_by(id: params[:id])
    end


    def new

        @mixtape = Mixtape.new
        
    end

    def create
        @mixtape = Mixtape.new(mixtape_params)
        
        # @mixtape = current_user.created_tapes.build(tape_params)
        
        if @tape.save
            redirect_to tape_path(@tape)
        else
            flash[:message] = @tape.errors.full_messages.to_sentence 
            redirect_to new_tape_path
    
    
    end
    
    def edit
        @mixtape = Mixtape.find_by(id: params[:id])

    end
  
    def recent_mixtape
        @mixtapes = Mixtape.recent_mixtape

    end

  
    def search
        @mixtapes = Mixtape.search(params[:title])
    end


    private
    
    def mixtape_params(*args)
        # params.require(:tape).permit(:title, :artist, :features, :artcover, :genre)
        (*args)
    end


end
