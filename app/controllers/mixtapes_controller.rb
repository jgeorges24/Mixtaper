class MixtapesController < ApplicationController



    def index
        @mixtapes = Mixtape.all
    end

    def show
        @mixtape = Mixtape.find_by(id: params [:id])
    end

    def new 

        @mixtape = Mixtape.new

    end



end
