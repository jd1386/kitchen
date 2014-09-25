Rails.application.routes.draw do
  
  root 'recipes#index'
  
  resources :ingredients
  resources :recipes

  devise_for :users

  devise_scope :user do
  	get '/login/', to: 'devise/sessions#new', as: 'login'
  	get '/signup', to: 'devise/registrations#new', as: 'signup'
 
end
