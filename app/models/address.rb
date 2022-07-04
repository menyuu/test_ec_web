class Address < ApplicationRecord
  belongs_to :customer

  def address_display
    "〒 郵便番号 #{address} #{name}様"
  end
end
