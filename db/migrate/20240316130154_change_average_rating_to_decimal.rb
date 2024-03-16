class ChangeAverageRatingToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :average_rating, :decimal, precision: 10, scale: 2

  end
end
