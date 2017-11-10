Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :tasks
  end
  resources :companies do
    resources :tasks
  end 

  root 'tasks#index'

end
