class AddNullConstraintToReservationDate < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :reservation_date, :datetime, null: false
  end
end
