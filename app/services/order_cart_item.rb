# frozen_string_literal: true

class OrderCartItem
  attr_accessor :product, :quantity, :total_item_price

  def initialize(product, quantity, total_item_price)
    @product = product
    @quantity = quantity
    @total_item_price = total_item_price
  end
end
