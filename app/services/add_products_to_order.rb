# frozen_string_literal: true

class AddProductsToOrder
  attr_accessor :cart, :checkout_id

  def initialize(cart, checkout_id)
    @cart = cart
    @checkout_id = checkout_id
  end

  def add
    @cart.items.each do |item|
      OrderProduct.create(checkout_id: @checkout_id, product_id: item.product_id, quantity: item.quantity)
    end
  end
end
