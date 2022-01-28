# frozen_string_literal: true

class OrderCart
  attr_accessor :items

  def initialize(order)
    @items = []
    order.order_products.include(:product).each do |order_product|
      @items.push(
        OrderCartItem.new(
          order_product.product,
          order_product.quantity,
          order_product.total_item_price,
        ),
      )
    end
  end

  def total
    @items.inject(0) { |sum, item| sum + item.total_item_price } * (1 - (@discount / 100.0))
  end
end
