# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer          not null
#  item_id     :integer          not null
#
# Indexes
#
#  index_cart_items_on_customer_id  (customer_id)
#  index_cart_items_on_item_id      (item_id)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#  item_id      (item_id => items.id)
#
class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * amoun
  end

  # def currency_unit
  #   number_to_currency(self, unit: "", precision: 0, format: "%u%n")
  # end
end
