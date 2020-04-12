Rails.application.routes.draw do

  

  get '/' => 'sessions#welcome'
  get 'auth/google_oauth2/callback' => 'sessions#google_create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'

  get '/home' => 'users#home'



 

  resources :reviews
  resources :hotels
  resources :locations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
