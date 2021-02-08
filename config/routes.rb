Rails.application.routes.draw do
  resources :categories, except: [:new, :edit, :delete]
  get 'comments/create'
  resources :videos do
    resources :comments, module: :videos
    resources :likes
  end
  resources :comments 
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:show, :edit]
  get 'about', to: 'pages#about'
  get 'teachers', to: 'pages#teachers'
  

  # get 'users/:id', to: 'users#show'
  # get 'users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
