class DropReservationDateFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :reservation_date, :datetime
  end
end
