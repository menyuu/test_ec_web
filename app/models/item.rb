class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :users, through: :cart_items

  def with_tax_price
    (price.to_i * 1.1).floor
  end
end
