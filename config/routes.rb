Rails.application.routes.draw do
  devise_for :users,
  # For Facebook connect
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projections, only: [:new, :create, :show, :index, :edit, :update]
  resources :bookings, only: [:create]
  resources :users, only: [:show, :edit, :update]
  resources :reviews, only: [:create, :update]

  root to: 'pages#home'
  # For attachinary
  mount Attachinary::Engine => "/attachinary"

end
