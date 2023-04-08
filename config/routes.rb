Rails.application.routes.draw do
  resources :movies
  get 'home/index'
  resources :articles
  resources :posts
  devise_for :users
  resources :listes
  # root "articles#index"
  #root "listes#index"
  root "home#index"
end
