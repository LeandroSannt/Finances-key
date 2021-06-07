Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :transactions
  resources :categories

  root to: "transactions#index"

end
