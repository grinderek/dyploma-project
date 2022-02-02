# frozen_string_literal: true

module Types
  class PromoCodeType < Types::BaseObject
    field :id, ID, null: false
    field :code, String
    field :percent, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
