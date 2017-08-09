Rails.application.routes.draw do
  root 'application#home'

  resources :attractions
  resources :users
  resources :sessions
  resources :rides


  get '/signin' => 'sessions#new'
  get '/users/new' => 'users#new', as: 'signup'
  delete '/sessions/:id' => 'sessions#destroy', as: 'logout'
end
