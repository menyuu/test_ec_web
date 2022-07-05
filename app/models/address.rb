class Address < ApplicationRecord
  belongs_to :customer

  def address_display
    "〒#{code} #{address} #{name}様"
  end
end
