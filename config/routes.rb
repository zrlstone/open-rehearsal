Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rehearsals do
    member do
      get :add_roles
      post :build_role
    end
    # resources :roles, only: [:new, :create] # or - simple form hidden fields for create. Won't need nesting.
  end

  resources :roles, only: [:edit, :update, :destroy] do
    resources :requests, only: [:create]
  end

  resources :requests, only: [:index, :destroy]
  resources :skills, only: [:create, :destroy]
  resources :users, only: [:show]
end
