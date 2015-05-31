Rails.application.routes.draw do

  root 'posts#index'

  ##### Sign Up and Sign In and Sign Out
  get '/signup' => 'users#new'
  # post '/users' => 'users#create'
  # get '/users/:id' => 'users#show', as: :user

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  
  get "/signout" => 'sessions#destroy'
    
  resources :posts
  resources :comments
  resources :categories
  resources :mappings
  resources :users do
    member do
      get '/following' => 'users#following'
      get '/followers' => 'users#followers'
      get '/posts' => 'users#posts'
      get '/meows' => 'users#friends_posts'
    end
  end
  resources :relations
end