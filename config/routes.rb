Rails.application.routes.draw do
  root to: 'vehicles#index'
  devise_for :users

  resources :services do
    member do
      delete 'delete_receipt/:receipt_id', action: 'delete_receipt', as: 'delete_receipt'
    end
  end
  resources :vehicles do
    member do
      get "services"
    end
    collection do

    end
  end
end
