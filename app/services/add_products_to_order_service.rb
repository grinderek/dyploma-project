# frozen_string_literal: true

class AddProductsToOrderService
  attr_accessor :cart, :order_id

  def initialize(cart, order_id)
    @cart = cart
    @order_id = order_id
  end

  def add
    @cart.items.each do |item|
      OrderProduct.create(
        order_id: @order_id,
        product_id: item.product_id,
        quantity: item.quantity,
        total_item_price: item.total_item_price,
      )
    end
  end
end
