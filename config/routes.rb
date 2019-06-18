Rails.application.routes.draw do
  get 'logs/new'
  get 'logs/edit'
  get 'logs/index'
  get 'gyms/new'
  get 'gyms/edit'
  get 'gyms/index'
  get 'gyms/show'
  devise_for :users
  root to: 'pages#home'
  resources :gyms do
    resources :logs, only: [:new, :create, :edit, :update]
  end
  resources :logs, only: [:index, :show, :destroy]
end
