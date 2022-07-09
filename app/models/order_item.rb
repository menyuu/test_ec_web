class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status: { start_load: 0, waiting_production: 1, production: 2, production_completed: 3 }
end
