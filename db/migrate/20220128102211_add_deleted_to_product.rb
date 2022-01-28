# frozen_string_literal: true

class AddDeletedToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :deleted, :boolean
  end
end
