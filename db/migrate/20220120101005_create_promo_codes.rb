# frozen_string_literal: true

class CreatePromoCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.integer :percent

      t.timestamps
    end
  end
end
