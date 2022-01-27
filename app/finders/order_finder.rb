# frozen_string_literal: true

class OrderFinder < BaseFinder
  model Order

  def search(id = nil)
    orders = from_id(id) if id
    orders
  end

  def from_id(id)
    scope.where(id)
  end
end
