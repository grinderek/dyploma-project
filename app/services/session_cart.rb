# frozen_string_literal: true

class SessionCart
  attr_accessor :items

  def initialize(params = { 'items' => {} })
    params = { 'items' => {} } if params.nil?
    @items = []
    params['items'].each do |key, _value|
      unless ProductFinder.search(id: key['product_id']).empty?
        cart_item = SessionCartItem.new(key['product_id'], key['quantity'])
        @items.push(cart_item)
      end
    end
  end

  def total
    @items.inject(0) { |sum, item| sum + item.total_item_price }
  end
end
