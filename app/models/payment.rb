class Payment < ApplicationRecord
  belongs_to :reservation
  monetize :sub_total_cents, allow_nil: true
  monetize :weekly_discount_cents, allow_nil: true
  monetize :service_fee_cents, allow_nil: true
  monetize :cleaning_fee_cents, allow_nil: true
  monetize :total_cents, allow_nil: true
end
