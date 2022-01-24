# frozen_string_literal: true

class SessionCartItem
  attr_accessor :product_id, :quantity

  def initialize(product_id, quantity)
    @product_id = product_id
    @quantity = quantity
  end

  def product
    ProductFinder.search(id: @product_id).first
  end

  def total_item_price
    ProductFinder.search(id: @product_id).first.price * @quantity
  end
end
