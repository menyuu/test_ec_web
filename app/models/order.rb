class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, done: 4 }
end
