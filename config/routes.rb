Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :users, only: [:index]
  root to: 'pages#home'
  get '/about/', to: 'pages#about'
  get '/terms/', to: 'pages#terms'
  resources :gyms do
    resources :routes, only: [:new, :create, :edit, :update]
  end
  resources :routes do
    resources :logs, only: [:new, :create, :edit, :update]
  end
  resources :routes, only: [:index, :show, :destroy]
  resources :logs, only: [:index, :destroy]


end
