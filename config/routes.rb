Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]

  root "novels#index"
  resources :titles, only: [:new, :create]
  # root "volumes#new"
end