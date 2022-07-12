# == Schema Information
#
# Table name: customers
#
#  id                     :integer          not null, primary key
#  address                :string
#  code                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_deleted             :boolean          default(FALSE)
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
