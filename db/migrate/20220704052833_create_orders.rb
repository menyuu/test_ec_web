class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :order_name, null: false
      t.string :order_address, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
