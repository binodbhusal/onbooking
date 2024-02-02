10.times do
    Property.create(
        name: Faker::Lorem.word,
        headline: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        address1: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country
    )
end 