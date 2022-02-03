# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # /products
    field :products, [Types::ProductType], null: true
    def products
      Product.all
    end

    # /orders
    field :orders, [Types::OrderType], null: true
    def orders
      Order.all
    end

    # /order/:id
    field :order, Types::OrderType, null: false do
      argument :id, ID, required: true
    end

    def order(id:)
      Order.find(id)
    end
  end
end
