# frozen_string_literal: true

class CreateCheckoutProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkout_products do |t|
      t.belongs_to :product
      t.belongs_to :checkout
      t.integer :quantity

      t.timestamps
    end
  end
end
