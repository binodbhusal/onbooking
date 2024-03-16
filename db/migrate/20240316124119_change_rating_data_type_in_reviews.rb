class ChangeRatingDataTypeInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :rating, :bigint
  end
end
