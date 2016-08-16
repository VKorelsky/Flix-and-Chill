Rails.application.routes.draw do
  devise_for :users
  root to: 'projections#index'

  resources :projections, only: [:new, :create, :show, :index, :edit, :update]
  resources :bookings, only: [:create]
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
