Rails.application.routes.draw do

  devise_for :users
  root to: "rooms#index"

resources :rooms do
  collection do
    get 'search'
  end

  resources :comments, only: :create
  resources :reviews, only: [:index, :create]
end
end
