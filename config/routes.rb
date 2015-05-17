Rails.application.routes.draw do


  root 'posts#index'

  ##### Sign Up and Sign In and Sign Out
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  
  get "/signout" => 'sessions#destroy'
  
#   get '/posts' => 'posts#index'
#   get '/posts/new' => 'posts#new', :as => 'new_post'
#   
#   post '/posts' => 'posts#create'
#   get '/posts/:id' => 'posts#show', :as => 'post'
#   
#   delete '/posts/:id' => 'posts#destroy' 
#   get '/posts/:id/edit' => 'posts#edit', :as => 'edit_post'
#   patch '/posts/:id' => 'posts#update'
    
  resources :posts
  resources :comments
  resources :categories
  
end