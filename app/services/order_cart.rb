# frozen_string_literal: true

class OrderCart
  attr_accessor :items

  def initialize(order)
    @items = []
    order.products.each do |product|
      item = OrderProductFinder.search(product.id, order.id).first
      @items.push(OrderCartItem.new(product, item.quantity, item.total_item_price))
    end
  end
end
