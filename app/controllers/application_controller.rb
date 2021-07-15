class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :logged_out?, :redirect_if_not_logged, :redirect_if_logged, :mixtape_true_creator, :not_mixtape_true_creator



    

    def current_user

        @current_user ||= User.find_by_id(session[:user_id])

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

end
