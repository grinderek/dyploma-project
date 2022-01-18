# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  scope '/admin' do
    get '/', to: 'welcome#index'
    resources :products, except: [:index]
    get '/products', to: 'products#admin_index'
    delete '/products' => 'products#destroy'
  end

  resources :cart_items, only: %i[create update]
  resources :products, only: %i[index show], as: 'user_product'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'

  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
end
