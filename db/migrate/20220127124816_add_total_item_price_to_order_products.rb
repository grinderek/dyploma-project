# frozen_string_literal: true

class AddTotalItemPriceToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :order_products, :total_item_price, :integer
  end
end
