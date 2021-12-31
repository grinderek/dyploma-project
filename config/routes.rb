# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  scope '/admin' do
    get '/', to: 'welcome#index'
    resources :products
    resource :product
  end

  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
end
