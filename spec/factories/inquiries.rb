FactoryGirl.define do
  
  factory :inquiry do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
    reply   { nil }
  end
  
  factory :reply, class: Inquiry do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
    reply   { Faker::Lorem.paragraph }
  end
  
end
