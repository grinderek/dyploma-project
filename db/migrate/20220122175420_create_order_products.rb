# frozen_string_literal: true

class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.integer :quantity

      t.timestamps
    end
  end
end
