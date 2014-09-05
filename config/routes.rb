Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do
  	resources :comments, only: [:edit, :update, :create, :destroy]
  end

  resources :contacts, only: [:new, :create]
  
	root 'homes#home'

end
