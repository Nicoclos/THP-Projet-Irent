Rails.application.routes.draw do
  root to: "items#index"
  resources :teams, only: :index
  resources :contact, only: :index
  resources :orders


  devise_for :users
  resources :users do
    resources :profile_picture, only: [:create]
  end
  resources :items do
    resources :img_products, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
