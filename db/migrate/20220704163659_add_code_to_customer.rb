class AddCodeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :code, :integer
  end
end
