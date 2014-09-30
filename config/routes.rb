Rails.application.routes.draw do
  
  resources :admins

  root 'recipes#index'
  
  resources :ingredients
  
  resources :recipes do
    resources :comments
    resources :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show]


  devise_for :users 

  devise_scope :user do
  	get '/login/', to: 'devise/sessions#new', as: 'login'
  	get '/signup', to: 'devise/registrations#new', as: 'signup'
  	get '/settings', to: 'devise/registrations#edit', as: 'settings'
    get 'sign_in', to: 'devise/sessions#new'
	end
 
end
