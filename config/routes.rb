Rails.application.routes.draw do
  devise_for :users
resources :stories do
  resources :characters do
    resources :relationships, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :locations
  resources :histories
end
root "stories#index"
end
