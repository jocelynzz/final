Rails.application.routes.draw do

  root 'posts#index'

  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new', :as => 'new_post'
  
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show', :as => 'post'
  
  delete '/posts/:id' => 'posts#delete' 
  get '/posts/:id/edit' => 'posts#edit', :as => 'edit_post'
  patch '/posts/:id' => 'posts#update'

end