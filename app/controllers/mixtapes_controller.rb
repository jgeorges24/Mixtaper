class MixtapesController < ApplicationController



    def index
        @mixtapes = Mixtape.all
    end

    def show
        @mixtape = Mixape.find_by(id: params[:id])
    end

    def new 

        @mixtape = Mixtape.new

    end

    def create 

        @mixtape = Mixtape.new(mixtape_params)

        if @mixtape.save
            redirect_to mixtape_path(@mixtape)
        else
            #flash message
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
                redirect_to @mixtape
            end

    end

    def home
        @mixtapes = Mixtape.all
    end

    def recent_mixtape

        @mixtapes = Mixtape.recent_mixtape

    end

    def Search

        @tapes = Tape.search(params[:title])

    end

    def destroy 
        @mixtape = Mixtape.find_by(id: params[:id])
        @mixtape.destroy
        redirect_to mixtapes_path

    end

    private
    #stronger params
    def mixtape_params#(*args)
        params.require(:mixtape).permit(:title, :artist, :features, :artcover, :genre)#(*args)
    end

end
