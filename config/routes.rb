Rails.application.routes.draw do


  root 'posts#index'

  ##### Sign Up and Sign In and Sign Out
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  
  get "/signout" => 'sessions#destroy'
    
  resources :posts
  resources :comments
  resources :categories
  resources :mappings
  
end