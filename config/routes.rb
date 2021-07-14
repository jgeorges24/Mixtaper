Rails.application.routes.draw do
  
  get 'mixtape/edit'
  get 'mixtape/new'
  get 'mixtape/recent_mixtape'
  get 'mixtape/search'
  get 'mixtape/show'
  resources :users, only: [:new, :create]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get '/logout', to: 'sessions#logout'


  get '/search', to: 'mixtapes#search'
  get '/recent_mixtape', to: 'mixtapes#recent_mixtape'

 #homepage static element/page
    root('sessions#welcome')

  #resources :users
  resources :mixtapes


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
