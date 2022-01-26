# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :orders, only: %i[new create]
  scope '/admin' do
    get '/', to: 'welcome#index'
    resources :products, except: [:index]
    resources :promo_codes, only: %i[new create]
    resources :orders, only: %i[index show]
    get '/products', to: 'products#admin_index'
    delete '/products' => 'products#destroy'
  end

  resource :cart, controller: 'cart', only: [:show] do
    post 'add_to_cart/:id', to: 'cart#add_to_cart', as: 'add_to'
    post 'update_cart/:id', to: 'cart#update', as: 'update'
    delete 'remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from'
  end
  resources :products, only: %i[index show], as: 'user_product'
  post 'discount', to: 'orders#discount'

  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
end
