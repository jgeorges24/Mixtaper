class OpinionsController < ApplicationController

    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]

    helper_method :not_user_opinion, :true_user_opinion, :tape_Opinion_count, :not_mixtape_true_creator


   
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
        #to do 
        #@opinion = Opinion.new(opinion_params)
        @mixtape = Mixtape.find_by_id(opinion_params[:mixtape_id])
        @opinion = @mixtape.opinions.build(opinion_params)
        if @opinion.save
            flash[:message] = "opinion added"
            redirect_to user_mixtape_path(@mixtape.user, @mixtape)
        else
            flash[:message] = @opinion.errors.full_messages.to_sentence
            render :new
        end
    end

    def destroy
        @mixtape = Mixtape.find_by(id: params[:id])
        @opinion = @mixtape.opinions.find_by(params[:id])
        @opinion.destroy
        flash[:message] = "opinion removed"
        redirect_to user_mixtape_path(@mixtape)
        #try using just tape to test out rails magic
    end


    
    private
    #Strong params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :mixtape_id)
    end
end
