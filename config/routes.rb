Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] do
    resources :wagons, only: [:new, :create]
    resources :bookings, only: [:destroy, :edit, :update]
  end
  resources :wagons, only: [:index, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
end
