# frozen_string_literal: true

class FixColumnNames < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.rename :name, :customer_name
      t.rename :address, :delivery_address
      t.rename :delivery, :delivery_method
    end
  end
end
