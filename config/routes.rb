Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'pages#home'
  get '/about/', to: 'pages#about'
  get '/terms/', to: 'pages#terms'

  resources :areas do
    resources :sub_areas, only: [:new, :create, :edit, :update]
  end
  resources :sub_areas, only: [:show, :destroy] do
    resources :od_routes, only: [:new, :create, :edit, :update]
  end
  resources :od_routes, only: [:show, :destroy] do
    resources :od_logs, only: [:new, :create, :edit, :update]
  end
  resources :od_logs, only: [:index, :destroy]

  resources :gyms do
    resources :routes, only: [:new, :create, :edit, :update]
  end
  resources :routes do
    resources :logs, only: [:new, :create, :edit, :update]
  end
  resources :routes, only: [:index, :show, :destroy]
  resources :logs, only: [:index, :destroy] do
    member do
      get 'duplicate'
    end
  end

end
