Rails.application.routes.draw do
  devise_for :users

  root "novels#index"
  # root "titles#edit"
  # root "volumes#new"
  resources :users, only: [:edit, :update]
end