Rails.application.routes.draw do
  root to: 'home#index'
  resources :tags
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :articles
end
