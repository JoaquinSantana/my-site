Rails.application.routes.draw do

  resources :projects, only: [:show]

  devise_for :users
  
  resources :posts do
    resources :comments, only: [:edit, :update, :create, :destroy]
  end
	get 'posts/:post_id/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

  resources :contacts, only: [:new, :create]
  resources :tags, only: [:index, :show]

  get '/nowezdjecie', to: 'tags#nowezdjecie'
  
  root 'homes#home'

end
