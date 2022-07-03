class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

  # def currency_unit
  #   number_to_currency(self, unit: "", precision: 0, format: "%u%n")
  # end
end
