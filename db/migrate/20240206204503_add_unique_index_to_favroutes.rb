class AddUniqueIndexToFavroutes < ActiveRecord::Migration[7.0]
  def change
    add_index :favroutes, [:property_id, :user_id], unique: true
  end
end
