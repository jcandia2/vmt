Rails.application.routes.draw do
  root to: 'vehicles#index'
  devise_for :users

  resources :services
  resources :vehicles do
    member do
      get "services"
    end
    collection do

    end
  end
end
