Rails.application.routes.draw do
  resources :orders do
    member do
      get 'orderdetail'
    end
  end
  resources :data_entries
  resources :user_agrovets
  resources :agrovets do
    resources :orders, only: [:index, :show, :new, :create]
    member do
      get 'agrovetinfo'
      get 'placeorder'
      get 'allorders'
      
    end
    get 'data_entries/new'
    get 'orders/new'
  end
  resources :products
  devise_for :users
  root "pages#home"
  get 'products/index'
  get 'agrovets/index'
  get 'admin', to: 'pages#admin', as: 'pages_admin'
  get 'salesrep', to: 'pages#salesrep', as: 'pages_salesrep'
end
