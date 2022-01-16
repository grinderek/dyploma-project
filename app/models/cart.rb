# frozen_string_literal: true

class Cart
  attr_accessor :items

  def initialize(params = { 'items' => {} })
    params = { 'items' => {} } if params.nil?
    @items = []
    params['items'].each do |key, _value|
      cart_item = CartItem.new(key['product_id'], key['quantity'])
      @items << cart_item
    end
  end
end
