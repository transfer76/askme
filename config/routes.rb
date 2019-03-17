Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: [:destroy]
  resources :session, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]
end
