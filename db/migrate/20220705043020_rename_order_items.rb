class RenameOrderItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_items, :order_amount, :amount
    rename_column :order_items, :order_price, :price
  end
end
