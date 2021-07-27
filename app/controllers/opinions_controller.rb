class OpinionsController < ApplicationController
helper_method :the_mixtape, :the_opinion, :the_user

    before_action :redirect_if_not_logged, only: [:create, :update, :destroy, :edit]

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
            redirect_to user_mixtape_path(@mixtape.user, @mixtape)
            # render :new, caused and error changed it to redirect insdeat 
        end
    end

    def destroy
        #binding.pry
        the_opinion
        the_mixtape
        the_user
        @opinion.destroy
        flash[:message] = "opinion removed"
        redirect_to user_mixtape_path(@user, @mixtape)
         
    end

    # def popular_tape
    #     @mixtape = Mixtape.all
    #     @user = current_user
    
    # end


    

    private
    #Strong params to keep uneeded requests
    def opinion_params
        params.require(:opinion).permit(:context, :user_id, :mixtape_id)
    end
end
