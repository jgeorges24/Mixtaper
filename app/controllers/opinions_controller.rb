class OpinionsController < ApplicationController

    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]


   
    def index
            if params[:mixtape_id] && @mixtape = Mixtape.find_by_id(params[:mixtape_id])
                @opinions = @mixtape.opinions
            else
                flash[:message] = "no tape with that id jack"
                @opinions = Opinion.all
            end
    end

    def show

        @mixtape = Mixtape.find_by(id: params[:id])
        @opinion = @mixtape.opinions.find_by(params [:mixtape_id])

    end


    def new
        
        @mixtape = Mixtape.find_by_id(params[:mixtape_id])
        @opinion = @mixtape.opinions.build
        @opinions = Opinion.all
    end


    def create
        #binding.pry

        @mixtape = Mixtape.find_by_id(params[:mixtape_id])
        @opinion = @mixtape.opinions.build(opinion_params)
        if @opinion.save
            flash[:message] = "opinion added"
            redirect_to user_mixtapes_path(@mixtape)
        else
            flash[:message] = @opinion.errors.full_messages.to_sentence
            render :new
        end
    end

   


    
    private
    #Strong params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :tape_id)
    end
end
