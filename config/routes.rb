Rails.application.routes.draw do
  resources :tags
  resources :posts
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
end
