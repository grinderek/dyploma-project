# frozen_string_literal: true

module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :customer_name, String
    field :email, String
    field :delivery_method, String
    field :delivery_address, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :discount, Integer

    field :products, [Types::ProductType], null: false
    field :order_products, [Types::OrderProductType], null: false
  end
end
