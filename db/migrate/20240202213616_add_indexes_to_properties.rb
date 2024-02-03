class AddIndexesToProperties < ActiveRecord::Migration[7.0]
  def change
    add_index :properties, :latitude
    add_index :properties, :longitude
  end
end
