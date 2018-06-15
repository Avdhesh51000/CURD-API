Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:new, :create, :destroy]

  get '/login' ,to: 'sessions#new' 
  post '/login' ,to: 'sessions#create' 
  get '/logout' ,to: 'sessions#destroy' 
  get '/out' ,to: 'sessions#logout' 
  resources :users
  resources :movies do
    get "serve" 
    resources :comments
	end
  get 'movies/like/:id' ,to: 'movies#like_me',as: "like"
  get 'movies/dislike/:id' ,to: 'movies#dislike_me',as: "dislike"
  get 'logedin/home' ,to: 'movies#home',as: "home"


  root 'users#index'

end
