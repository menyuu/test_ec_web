class AddOrderCodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_code, :integer
  end
end
