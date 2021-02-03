Rails.application.routes.draw do
  resources :videos
  root to: 'pages#home'
  devise_for :users
  resources :users
  get 'about', to: 'pages#about'
  # get 'users/:id', to: 'users#show'
  # get 'users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
