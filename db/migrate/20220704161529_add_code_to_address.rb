class AddCodeToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :code, :integer
  end
end
