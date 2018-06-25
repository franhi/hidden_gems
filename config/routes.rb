Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :saves, only: [ :create, :destroy ]
    resources :been_theres, only: [ :create, :destroy ]
    resources :reviews, only: [ :new, :create, :destroy] do
      resources :likes, only: [ :create, :destroy ]
    end
  end
end
