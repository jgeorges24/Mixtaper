Mixtaper

README

Mixtaper Rails Web App.

#Description

Have you ever weanted to let the world know about your mixtape coming out and wanted an honest opinion, well now you canm by signing up and uploading that information to the web app and watch as users can share their opinion about your mixtape. Mixtaper A WEB APP/DEMO

#Installation

Guide fork and clone repo, bundle install, run rails s in terminal, use broswer to navigate to local host http://127.0.0.1:3000/

Fork and clone this repo. open it in VS code and type "bundle install" to make sure you have those gems installed and right after lets make sure we run "rails s". lets then open our broswer to "http://127.0.0.1:3000"

#CONTRIBUTING

JEAN GEORGES and open for more support and asstiance. If any issue file one using a pull request.

#USAGE

user will be able to sign up, and log his/her mixtape with and watch other users leave opinions on the mixtape.

#Guide

SIGN UP PAGE

def create

@user = User.new(user_params)
    if @user.save
        flash[:message] = "Sign Up Success!"
        session[:user_id] = @user.id
        redirect_to tapes_path
    else
        flash[:message] = @user.errors.full_messages.to_sentence
        #flash[:message] = "missing info"
        render :new
        #flash[:notice] = "username is not proper"
    end
end

#Code Of Conduct

Play nice you know right from wrong, so lets contribute peacfully and no negative vibes. use code respecfully.

#LICESNE MIT

This project has been licensed under the MIT open source license
