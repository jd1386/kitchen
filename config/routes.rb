Rails.application.routes.draw do
  
  
  resources :ingredients

  root 'recipes#index'

  resources :recipes

 
end
