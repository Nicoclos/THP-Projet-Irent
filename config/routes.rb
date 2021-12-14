Rails.application.routes.draw do
  get "/home" => "static_pages#home"

  get 'search_output' => 'items#search_output', as: 'search_output'

  root to: "items#index"
  resources :teams, only: :index
  resources :contact, only: :index
  resources :orders


  devise_for :users
  resources :items
  resources :categories, only: [:index, :create, :destroy]

  resources :users do
    resources :profile_picture, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
