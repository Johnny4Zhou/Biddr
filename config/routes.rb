Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'auctions#index'

  resources :users

  resources :bids, only: [:index]

  resources :auctions do
    resources :bids, only: :create
    resources :publishings, only: :create
  end

  resources :sessions, only: [:destroy, :create, :new] do
    delete :destroy, on: :collection
  end

end
