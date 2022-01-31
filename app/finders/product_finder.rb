# frozen_string_literal: true

class ProductFinder < BaseFinder
  model Product

  def search(params)
    products = Product.all
    products = new(products).from_deleted(params[:deleted]) unless params[:deleted].nil?
    products = new(products).from_id(params[:id]) unless params[:id].nil?
    products
  end

  def from_id(id)
    scope.where(id: id)
  end

  def from_deleted(deleted)
    scope.where(deleted: deleted)
  end
end
