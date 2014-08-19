Rails.application.routes.draw do
  devise_for :users
  root 'homes#home'

  resources :posts
end
