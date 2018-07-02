Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # get 'users', to: 'pages#user_profile', as: :user
  patch 'users/:id', to: 'users#update', as: 'users_update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :user_tags, only:[ :create, :destroy ]
  end
  resources :posts do
    resources :reports, only: [ :new, :create, :destroy ]
    resources :favorites, only: [ :create, :destroy ]
    resources :post_tags, only:[ :create, :destroy ]
    resources :reviews, only: [ :new, :create, :destroy, :show] do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
    end
  end
end
