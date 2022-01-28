# frozen_string_literal: true

class ProductFinder < BaseFinder
  model Product

  def search(id = nil, deleted = false)
    products = from_deleted(deleted)
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
