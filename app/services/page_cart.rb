# frozen_string_literal: true

class PageCart
  attr_accessor :items

  def initialize(session_cart)
    @items = []
    session_cart.items.each do |item|
      product = ProductFinder.search(id: item.product_id).first
      @items.push(PageCartItem.new(product, item.quantity))
    end
  end

  def total
    @items.inject(0) { |sum, item| sum + (item.product.price * item.quantity) }
  end
end
