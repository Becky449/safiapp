Rails.application.routes.draw do
  resources :agrovets
  resources :products
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'products/index'
  get 'agrovets/index'
  get 'admin', to: 'pages#admin', as: 'pages_admin'
get 'salesrep', to: 'pages#salesrep', as: 'pages_salesrep'
end
