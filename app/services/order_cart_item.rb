# frozen_string_literal: true

class OrderCartItem
  attr_accessor :product, :quantity, :total_item_price

  def initialize(product, quantity, item_price)
    @product = product
    @quantity = quantity
    @item_price = item_price
  end

  def total_item_price
    @item_price * @quantity
  end
end
