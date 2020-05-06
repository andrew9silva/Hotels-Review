Rails.application.routes.draw do

  root 'sessions#welcome'

  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  

  get 'auth/:provider/callback' => 'sessions#google_create'
  get 'auth/failure', to: redirect('/')


 
  resources :hotels do 
    resources :reviews, except: :index
  end
  resources :locations

  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
