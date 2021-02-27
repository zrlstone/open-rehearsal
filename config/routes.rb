Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rehearsals do
    resources :roles, only: [:new, :create] do
      resources :requests, only: [:new, :create]
    end
  end

  resources :requests, only: [:edit, :update, :index]
  resources :skills, only: [:new, :create]

  resources :users, only: [:show]

end
