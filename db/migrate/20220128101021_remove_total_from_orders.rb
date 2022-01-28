# frozen_string_literal: true

class RemoveTotalFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :total
  end
end
