class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_items, dependent: :destroy

  def with_tax_price
    (price.to_i * 1.1).floor
  end
end
