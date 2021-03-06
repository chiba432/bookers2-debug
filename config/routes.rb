Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites,  only: [:create, :destroy]
  end
  resources :users, only: [:show,:index,:edit,:update]
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :followings, :followers
    end
  end
  get 'search' => 'search#search'
end