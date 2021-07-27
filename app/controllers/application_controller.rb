class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :logged_out?, :redirect_if_not_logged, :redirect_if_logged, :mixtape_true_creator, :not_mixtape_true_creator, :no_go, :not_user_opinion, :true_user_opinion, :tape_Opinion_count, :the_mixtape, :the_opinion, :the_user


    #before_action :authorized


    def current_user

        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def user

        @user ||= User.find_by_id(session[:user_id])

    end


    def logged_in?
        !!current_user
    end

    def logged_out?
        !current_user
    end

    def redirect_if_not_logged
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged
        flash[:message] = "already logged in"
        redirect_to user_mixtapes_path(current_user) if logged_in?
    end
    
    def mixtape_true_creator
        @mixtape = Mixtape.find_by(id: params[:id])
        @current_user == @mixtape.user

    end

    def no_go
    
        if !mixtape_true_creator
            redirect_to user_mixtapes_path
        end 

    
    end


    def not_mixtape_true_creator

        @mixtape = Mixtape.find_by(id: params[:id])
        @current_user != @mixtape.user
        redirect_to user_mixtapes_path

    end

    def not_user_opinion
        @mixtape = Mixtape.find_by(id: params[:mixtape_id])
        if @current_user.opinions != @mixtape.user.opinions
        flash[:message] = "opinion NOT yours"
    
        redirect_to user_mixtape_path(@mixtape)
        else
            flash[:message] = "opinion deleted"
        end   
    end
    
        def true_user_opinion
            @mixtape = Mixtape.find_by(id: params[:id])
            @opinion = @mixtape.opinions.find_by_id(params[:user_id])
            @current_user == @mixtape.opinions
        end
    
        def tape_Opinion_count
            @mixtape = Mixtape.find_by(id: params[:id])
            @mixtape.opinions.count
    
        end

        #opinions controller helpers

        def the_opinion

            @opinion = Opinion.find(params[:id])

        end

        def the_mixtape

            @mixtape = Mixtape.find(@opinion.mixtape.id)

        end

        def the_user

            @user = User.find(@opinion.mixtape.user.id)

        end



        # def authorized
        #     redirect_to '/welcome' unless logged_in?
        #  end


end
