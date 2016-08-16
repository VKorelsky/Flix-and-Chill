Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projections, only: [:new, :create, :show]

  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
