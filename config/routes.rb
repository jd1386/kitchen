Rails.application.routes.draw do
  
  resources :admins, only: :index

  namespace :admins do
    resources :recipes
    resources :food_items
    resources :comments
    resources :users
    resources :favorites
  end

  root 'recipes#index'
  
  resources :ingredients
  
  resources :recipes do
    resources :comments
    resources :favorites, only: [:create, :destroy]
  end

  


  devise_for :users 

  devise_scope :user do
  	get '/login/', to: 'devise/sessions#new', as: 'login'
  	get '/signup', to: 'devise/registrations#new', as: 'signup'
  	get '/settings', to: 'devise/registrations#edit', as: 'settings'
    get 'sign_in', to: 'devise/sessions#new'
	end

  resources :users, only: [:show]
 
end
