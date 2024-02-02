class AddAddressToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :address1, :string
    add_column :properties, :address2, :string
  end
end
