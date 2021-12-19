Rails.application.routes.draw do
  root 'buildings#index'
  resources :apartments
  resources :buildings
 
end
