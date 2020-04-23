Rails.application.routes.draw do

  root 'sessions#welcome'

  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  

  get 'auth/google_oauth2/callback' => 'sessions#google_create'


 
  resources :hotels do 
    resource :reviews 
  end
  resources :locations

  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
