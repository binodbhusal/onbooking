FactoryBot.define do
  factory :profile do
    user { nil }
    address1 { 'MyString' }
    address2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    country_code { Faker::Address.country_code }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
