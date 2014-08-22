Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do
  	resources :comments, only: [:edit, :update, :create, :destroy]
  end
  
	root 'homes#home'

end
