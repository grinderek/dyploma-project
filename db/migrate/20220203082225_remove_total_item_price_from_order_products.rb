# frozen_string_literal: true

class RemoveTotalItemPriceFromOrderProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_products, :total_item_price
  end
end
