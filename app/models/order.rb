# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  address        :string           not null
#  code           :integer
#  name           :string           not null
#  order_status   :integer          default("waiting")
#  payment_method :integer
#  total_price    :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer          not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#
class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, done: 4 }
end
