Rails.application.routes.draw do
  root 'homes#home'

  resources :posts
end
