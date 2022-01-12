# frozen_string_literal: true

class CreateCart_s < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :subtotal
      t.integer :total

      t.timestamps
    end
  end
end
