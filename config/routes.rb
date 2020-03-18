Rails.application.routes.draw do
resources :stories do
  resources :characters
end
root "stories#index"
end
