# frozen_string_literal: true

class OrderProductFinder < BaseFinder
  model OrderProduct

  def search(order_id = nil, product_id = nil)
    products = from_order_id(order_id) if order_id
    products = new(products).from_product_id(product_id) if product_id
    products
  end

  def from_product_id(product_id)
    scope.where(product_id: product_id)
  end

  def from_order_id(order_id)
    scope.where(order_id: order_id)
  end
end
