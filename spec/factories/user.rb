require 'faker'

FactoryBot.define do
  factory :random_user, class: User do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
