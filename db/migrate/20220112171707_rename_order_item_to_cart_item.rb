class RenameOrderItemToCartItem < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_items, :cart_items
  end
end
