Rails.application.routes.draw do
  
  #homepage static element/page
     root('sessions#welcome')
  
  resources :opinions

  resources :users, only: [:new, :create] do
    resources :mixtapes
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/welcome', to: 'sessions#welcome'
  
  delete '/logout', to: "sessions#logout"
  get '/logout', to: 'sessions#logout'

  get '/popular_mixtape', to: 'mixtapes#popular_tape'

  get '/ran_tape', to: 'mixtapes#ran_tape'


  get '/search', to: 'mixtapes#search'
  get '/recent_mixtape', to: 'mixtapes#most_recent'

  
  #ominauth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  



end
