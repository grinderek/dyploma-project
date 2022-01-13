# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  before_save :set_subtotal

  def subtotal
    cart_items.sum { |cart_item| cart_item.valid? ? cart_item.product.price * cart_item.quantity : 0 }
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
