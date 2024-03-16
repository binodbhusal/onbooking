class ChangeColumnDataTypeToBigInt < ActiveRecord::Migration[7.0]
  def change
    change_column :payments, :sub_total_cents, :bigint
    change_column :payments, :weekly_discount_cents, :bigint
    change_column :payments, :service_fee_cents, :bigint
    change_column :payments, :cleaning_fee_cents, :bigint
    change_column :payments, :total_cents, :bigint
  end
end
