# frozen_string_literal: true

class PageCart
  attr_accessor :items, :discount

  def initialize(session_cart)
    @items = []
    session_cart.items.each do |item|
      product = ProductFinder.search(id: item.product_id).first
      @items.push(PageCartItem.new(product, item.quantity))
    end
    @discount = session_cart.discount
  end

  def total
    @items.inject(0) { |sum, item| sum + item.total_item_price } * (1 - (@discount / 100.0))
  end
end
