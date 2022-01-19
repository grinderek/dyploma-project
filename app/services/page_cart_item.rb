# frozen_string_literal: true

class PageCartItem
  attr_accessor :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def total_item_price
    @product.price * quantity
  end

end
