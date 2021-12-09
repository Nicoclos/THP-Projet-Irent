Rails.application.routes.draw do
  root to: "items#index"
  resources :teams, only: :index
  resources :contact, only: :index



  devise_for :users
  resources :items
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
