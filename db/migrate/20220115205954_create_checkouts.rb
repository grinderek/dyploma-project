# frozen_string_literal: true

class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.string :name
      t.string :email
      t.string :delivery
      t.string :address
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
