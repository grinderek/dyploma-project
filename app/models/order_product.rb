# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total_item_price
    item_price * quantity
  end
end
