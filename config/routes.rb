Rails.application.routes.draw do
  
  root "articles#index"

  resources :categories, only:[:new, :create, :index, :show]
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :show]
  get 'login', to: "users#new_session"
  post 'login', to: "users#create_session"
  post 'logout', to: "users#destroy_session"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
