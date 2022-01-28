# frozen_string_literal: true

class ProductFinder < BaseFinder
  model Product

  def search(id = nil)
    products = undeleted
    products = from_id(id) if id
    products
  end

  def from_id(id)
    scope.where(id)
  end

  def undeleted
    scope.where(deleted: false)
  end
end
