# spec/factories/users.rb (for RSpec)
# test/factories/users.rb (for Minitest)
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end
end

