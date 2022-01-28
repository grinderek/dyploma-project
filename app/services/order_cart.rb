# frozen_string_literal: true

class OrderCart
  attr_accessor :items, :discount

  def initialize(order)
    @items = []
    order.order_products.includes(:product).each do |order_product|
      @items.push(
        OrderCartItem.new(
          order_product.product,
          order_product.quantity,
          order_product.total_item_price,
        ),
      )
    end
    @discount = order.discount
  end

  def total
    @items.inject(0) { |sum, item| sum + item.total_item_price } * (1 - (@discount / 100.0))
  end
end
