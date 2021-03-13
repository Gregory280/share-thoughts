Rails.application.routes.draw do
  resources :posts
  resources :categories, except: [:new, :edit, :delete]
  get 'comments/create'
  resources :comments do
    resources :comments, module: :comments
  end
  resources :videos do
    resources :comments, module: :videos
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  root to: 'pages#home'
  get 'search', to: 'pages#search'
  devise_for :users
  resources :users, only: [:show, :edit]
  get 'exams', to: 'pages#exams'
  get 'teachers', to: 'pages#teachers'
  

  # get 'users/:id', to: 'users#show'
  # get 'users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
