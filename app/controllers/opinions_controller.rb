class OpinionsController < ApplicationController
helper_method :the_mixtape, :the_opinion, :the_user

    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]

   
    # def index
    #         if params[:mixtape_id] && @mixtape = Mixtape.find_by_id(params[:mixtape_id])
    #             @opinions = @mixtape.opinions
    #         else
    #             flash[:message] = "no tape with that id jack"
    #             @opinions = Opinion.all
    #         end
    # end

    # def show
        
    #     @mixtape = Mixtape.find_by(id: params[:id])
    #     @opinion = @mixtape.opinions.find_by(params [:mixtape_id])

    # end

    def new
        the_mixtape
        # @mixtape = Mixtape.find_by_id(params[:mixtape_id])
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
        #binding.pry
        the_opinion
        the_mixtape
        the_user
        # @opinion = Opinion.find(params[:id])
        # @mixtape = Mixtape.find(@opinion.mixtape.id)
        # @user = User.find(@opinion.mixtape.user.id)
        #@opinion = @mixtape.opinions.find(mixtape_id: params[:id])
        #@opinion = Opinion.find_by(id: params[:id])
        @opinion.destroy
        flash[:message] = "opinion removed"
        redirect_to user_mixtape_path(@user, @mixtape)
        #try using just tape to test out rails magic
    end
    

    private
    #Strong params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :mixtape_id)
    end
end
