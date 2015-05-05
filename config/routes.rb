Rails.application.routes.draw do

  root 'posts#index'

  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show', :as => 'post'
  
  delete '/posts/:id' => 'posts#delete' 
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'

  #get '/places/:place_id/reviews' => 'reviews#index', :as => 'reviews'  
  #post '/places/:place_id/reviews'  => 'reviews#create'

end