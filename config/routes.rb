Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :transactions
  resources :categories

  match 'transactions/filter_transactions', via: [:get, :post], as: 'filter_transactions'

  root to: "transactions#index"

end
