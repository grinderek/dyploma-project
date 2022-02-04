# frozen_string_literal: true

module Types
  class OrderProductType < Types::BaseObject
    field :id, ID, null: false
    field :product_id, Integer
    field :order_id, Integer
    field :quantity, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :item_price, Integer

    field :product, Types::ProductType, null: false
  end
end
