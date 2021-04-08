Rails.application.routes.draw do
  resources :articles
  resources :users, only: [:new, :create]
  get 'login', to: "users#new_session"
  post 'login', to: "users#create_session"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
