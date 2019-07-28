Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gyms do
    resources :routes, only: [:new, :create, :edit, :update]
  end
  resources :routes do
    resources :logs, only: [:new, :create, :edit, :update]
  end
  resources :routes, only: [:index, :show, :destroy]
end
