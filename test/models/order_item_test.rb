# == Schema Information
#
# Table name: order_items
#
#  id                :integer          not null, primary key
#  amount            :integer
#  price             :integer
#  production_status :integer          default("start_load")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  item_id           :integer          not null
#  order_id          :integer          not null
#
# Indexes
#
#  index_order_items_on_item_id   (item_id)
#  index_order_items_on_order_id  (order_id)
#
# Foreign Keys
#
#  item_id   (item_id => items.id)
#  order_id  (order_id => orders.id)
#
require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
