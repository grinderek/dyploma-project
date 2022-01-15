# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  scope '/admin' do
    get '/', to: 'welcome#index'
    resources :products, except: [:index]
    get '/products', to: 'products#admin_index'
    delete '/products' => 'products#destroy'
  end

  get 'cart', to: 'carts#show'
  resources :cart_items, only: %i[create update]
  resources :products, only: %i[index show], as: 'user_product'
  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
end
