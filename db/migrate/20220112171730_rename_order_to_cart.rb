class RenameOrderToCart < ActiveRecord::Migration[6.1]
  def change
    rename_table :orders, :carts
  end
end
