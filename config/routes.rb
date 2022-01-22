# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  scope '/admin' do
    get '/', to: 'welcome#index'
    resources :products, except: [:index]
    resources :promo_codes, only: %i[new create]
    get '/products', to: 'products#admin_index'
    delete '/products' => 'products#destroy'
  end

  resources :orders, only: %i[new create]
  resources :products, only: %i[index show], as: 'user_product'
  get 'cart', to: 'cart#show'
  post 'cart/add_to_cart/:id', to: 'cart#add_to_cart', as: 'add_to_cart'
  post 'cart/update_cart/:id', to: 'cart#update', as: 'update_cart'
  delete 'cart/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  post 'discount', to: 'checkouts#discount'

  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
end
