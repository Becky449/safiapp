Rails.application.routes.draw do
  resources :data_entries
  resources :user_agrovets
  resources :agrovets do
    member do
      get 'agrovetinfo' # Your agrovetinfo route
    end
    get 'data_entries/new'
  end
  resources :products
    # Move this line inside the :agrovets block
  devise_for :users
  root "pages#home"
  get 'products/index'
  get 'agrovets/index'
  get 'admin', to: 'pages#admin', as: 'pages_admin'
  get 'salesrep', to: 'pages#salesrep', as: 'pages_salesrep'
end
