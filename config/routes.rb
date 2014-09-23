Rails.application.routes.draw do
  root 'recipes#index'
  
  resources :ingredients
  resources :recipes

 
end
