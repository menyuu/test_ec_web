# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  introduction :string
#  name         :string
#  price        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  genre_id     :integer          not null
#
# Indexes
#
#  index_items_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  genre_id  (genre_id => genres.id)
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
