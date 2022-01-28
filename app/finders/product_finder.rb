# frozen_string_literal: true

class ProductFinder < BaseFinder
  model Product

  def search(deleted = nil, id = nil)
    products = Product.all
    products = new(products).from_deleted(deleted) unless deleted.nil?
    products = new(products).from_id(id) if id
    products
  end

  def from_id(id)
    scope.where(id: id)
  end

  def from_deleted(deleted)
    scope.where(deleted: deleted)
  end
end
