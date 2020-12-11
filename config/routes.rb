Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]

  root "novels#index"
  resources :titles, only: [:new, :create, :edit, :update, :destroy] do
    resources :volumes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :create]
  end


end