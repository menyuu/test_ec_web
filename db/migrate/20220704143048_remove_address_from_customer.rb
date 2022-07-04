class RemoveAddressFromCustomer < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :Address, :string
  end
end
