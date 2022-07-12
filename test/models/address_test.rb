# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address     :string
#  code        :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer          not null
#
# Indexes
#
#  index_addresses_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
