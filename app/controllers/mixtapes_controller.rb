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
        
        if @mixtape.save
            redirect_to tape_path(@mixtape)
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
            redirect_to Mixtape
            #above made adjustment with rails magic 
        end

    end

    def destroy

        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.destroy
        redirect_to mixtapes_path

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
