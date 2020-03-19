Rails.application.routes.draw do
resources :stories do
  resources :characters
  resources :locations
  resources :histories
end
root "stories#index"
end
