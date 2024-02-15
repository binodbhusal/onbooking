class AddMoneyrailsFieldsToPayments < ActiveRecord::Migration[7.0]
  def change
    add_monetize :payments, :sub_total, amount: { null: true, default: nil },currency: { null: true, default: nil }
    add_monetize :payments, :weekly_discount, amount: { null: true, default: nil },currency: { null: true, default: nil }
    add_monetize :payments, :service_fee, amount: { null: true, default: nil },currency: { null: true, default: nil }
    add_monetize :payments, :cleaning_fee, amount: { null: true, default: nil },currency: { null: true, default: nil }
    add_monetize :payments, :total, amount: { null: true, default: nil },currency: { null: true, default: nil }
  end
end
