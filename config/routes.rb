Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#google_create'
  get '/signup' => 'users#new'


  get '/auth/google/callback' => 'sessions#google_create'

  resources :reviews
  resources :hotels
  resources :locations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
