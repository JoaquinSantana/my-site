Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do
    resources :comments, only: [:edit, :update, :create, :destroy]
  end
	get 'posts/:post_id/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

  resources :contacts, only: [:new, :create]
  
  root 'homes#home'

end
