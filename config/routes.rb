Rails.application.routes.draw do
  get 'gyms/new'
  get 'gyms/edit'
  get 'gyms/index'
  get 'gyms/show'
  devise_for :users
  root to: 'pages#home'
  resources :gyms, only: [:index, :show, :new, :create, :edit, :update]
  resources :logs, only: [:index, :show, :new, :create, :edit, :update]
end
