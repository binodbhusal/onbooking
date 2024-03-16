class ChangePriceCentsDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :price_cents, :bigint
  end
end
