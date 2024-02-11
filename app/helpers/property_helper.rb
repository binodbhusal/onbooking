module PropertyHelper
  def property_rating_percent(property:, rating:)
    reviews_count = property.reviews_count&.positive? ? property.reviews_count : 1
    ((property.reviews.where(rating:).size.to_f / reviews_count) * 100).to_i
  end
end
