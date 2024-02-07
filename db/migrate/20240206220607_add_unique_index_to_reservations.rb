class AddUniqueIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:property_id, :user_id, :reservation_date], unique: true, name:'index_unique_reservations'
  end
end
