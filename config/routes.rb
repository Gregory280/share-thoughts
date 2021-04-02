Rails.application.routes.draw do
  resources :playlists
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
  get 'my_bookmarks', to: 'pages#my_bookmarks'
  get 'search', to: 'pages#search'
  devise_for :users
  resources :users, only: [:show, :edit]
  get 'exams', to: 'pages#exams'
  get 'teachers', to: 'pages#teachers'
end
