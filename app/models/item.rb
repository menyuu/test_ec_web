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
class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def with_tax_price
    (price.to_i * 1.1).floor
  end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
