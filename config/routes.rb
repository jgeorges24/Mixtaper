Rails.application.routes.draw do

  resources :users, only: [:new, :create] do
    resources :mixtapes
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/welcome', to: 'sessions#welcome'
  
  delete '/logout', to: "sessions#logout"
  #get '/logout', to: 'sessions#logout'


  get '/search', to: 'mixtapes#search'
  get '/recent_mixtape', to: 'mixtapes#most_recent'

 #homepage static element/page
    root('sessions#welcome')

    
     


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
