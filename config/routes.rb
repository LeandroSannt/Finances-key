Rails.application.routes.draw do
  resources :transactions
  resources :categories

  root to: "transactions#index"

end
