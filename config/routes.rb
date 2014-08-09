Rails.application.routes.draw do
  root to: 'homes#home'

  resources :posts
end
