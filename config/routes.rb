Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :meals
end
