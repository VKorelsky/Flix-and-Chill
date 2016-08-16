Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projections, only: [:new, :create, :show, :index, :edit, :update]
  resources :bookings, only: [:create]
end
