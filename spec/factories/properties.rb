FactoryBot.define do
  factory :property do
    name { 'Mytest' }
    headline { 'Mytest' }
    description { 'Mytest' }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
  end
end
