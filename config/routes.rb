Rails.application.routes.draw do
  root 'application#home'
  
  resources :attractions
  resources :users
  resources :sessions
  resources :rides


end
