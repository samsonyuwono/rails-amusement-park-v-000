Rails.application.routes.draw do
  root 'application#home'

  resources :attractions
  resources :users
  resources :sessions
  resources :rides


  get '/signin', to: 'sessions#new'
  get '/users/new', to: 'users#new', as: 'signup'
  delete '/signout', to: 'sessions#destroy', as: 'logout'
  post '/sessions/create', to: 'sessions#create', as: 'create_session'
end
