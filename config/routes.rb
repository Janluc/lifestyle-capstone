Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :users, only: [:new, :create]
  get 'login', to: "users#new_session"
  post 'login', to: "users#create_session"
  post 'logout', to: "users#destroy_session"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
