10.times do |i|
    property = Property.create(
        name: Faker::Lorem.word,
        headline: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraphs(number:35).join(" "),
        address1: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        zip_code: Faker::Address.zip_code,
        price: Money.from_amount((25..100).to_a.sample)
    )
    property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property#{i+1}.png")), filename: property.name)
    (1..5).to_a.sample.times do 
        Review.create(reviewable: property, rating:(1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
    end
end 