class RenameOrdersColumnToOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :order_name, :name
    rename_column :orders, :order_address, :address
    rename_column :orders, :order_code, :code
    
  end
end
