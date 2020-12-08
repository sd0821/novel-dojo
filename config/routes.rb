Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]

  root "novels#index"
  resources :titles, only: [:new, :create, :edit, :update, :destroy] do
    resources :volumes, only: [:index, :new, :create, :show]
  end

  # root "volumes#new"
end