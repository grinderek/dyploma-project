class ProductFinder < BaseFinder
  model Product

  def search(id = nil)
    products = from_id(id) if id
    products
  end

  def from_id(id)
    scope.where(id)
  end

end