# frozen_string_literal: true

class AddDiscountToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :discount, :integer
  end
end
