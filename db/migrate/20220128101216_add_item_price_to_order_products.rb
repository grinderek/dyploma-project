# frozen_string_literal: true

class AddItemPriceToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :order_products, :item_price, :integer
  end
end
