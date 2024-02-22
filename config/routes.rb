Rails.application.routes.draw do
  get 'cart/show'
  post '/checkout', to: 'checkout#process_payment'

  resources :products do
    member do
      get :add_item
    end
  end
  resource :cart, only: [:show]
  devise_for :users
  root 'home#index'
  
end
