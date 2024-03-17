require 'open-uri'

user_images = []

    6.times do 
    avatar_url = Faker::LoremFlickr.image
    user_images << URI.parse(avatar_url).open
    end
    user = User.create(email:"bb@gmail.com", password:"123456")
    profile = Profile.create(user: user, first_name: "Binod", last_name: "Bhusal")
    user.profile.image.attach(io: user_images[0], filename: "#{user.profile.full_name}.jpg")
    5.times do |i|
    users = User.create(email: Faker::Internet.email, password:"password")
    users.profile.update(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name)
    users.profile.image.attach(io: user_images[i+1], filename: "#{users.profile.full_name}.jpg")
    end
    10.times do |i|
        price_in_dollars = rand(25..100)
        price_cents = Money.from_amount(price_in_dollars, "EUR").cents
        property = Property.create(
            user: user,
            name: Faker::Lorem.word,
            headline: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraphs(number:35).join(" "),
            address1: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            country_code: Faker::Address.country_code,
            zip_code: Faker::Address.zip_code,
            price_cents: price_cents,
            price_currency: "EUR",
        )
        property.images.attach(io: File.open(Rails.root.join("app", "assets", "images", "property#{i+1}.webp")), filename: "#{property.name}.png")
        (1..5).to_a.sample.times do 
            rating = rand(1..5)
            Review.create(
              user: User.all.sample,
              reviewable: property,
              rating: rating,
              title: Faker::Lorem.word,
              body: Faker::Lorem.paragraph
            )
          end
    end 
