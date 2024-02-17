require 'open-uri'

user_images = []

    6.times do 
    avatar_url = Faker::LoremFlickr.image
    user_images << URI.parse(avatar_url).open
    end
    user = User.create(email:"bb@gmail.com", password:"123456")
    user.profile.update(first_name:"Binod", last_name:"Bhusal")
    user.profile.image.attach(io: user_images[0], filename: "#{user.profile.full_name}.jpg")
    5.times do |i|
    users = User.create(email: Faker::Internet.email, password:"password")
    users.profile.update(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name)
    users.profile.image.attach(io: user_images[i+1], filename: "#{users.profile.full_name}.jpg")
    end
    10.times do |i|
        property = Property.create(
            name: Faker::Lorem.word,
            headline: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraphs(number:35).join(" "),
            address1: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            country_code: Faker::Address.country_code,
            zip_code: Faker::Address.zip_code,
            price: Money.from_amount((25..100).to_a.sample)
        )
        property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property#{i+1}.png")), filename: "#{property.name}.png")
        (1..5).to_a.sample.times do 
            Review.create(user:User.all.sample, reviewable: property, rating:(1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
        end
    end 
