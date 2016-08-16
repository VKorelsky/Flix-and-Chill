Rails.application.routes.draw do
  devise_for :users

  # TODO: change default homepage
  root to: 'pages#home'

  resources :projections, only: [:new, :create, :show, :index, :edit, :update]
  resources :bookings, only: [:create]
  resources :users, only: [:show, :edit, :update]

  # For attachinary
  mount Attachinary::Engine => "/attachinary"
end
