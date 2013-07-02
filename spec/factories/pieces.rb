FactoryGirl.define do
  factory :piece do
    title         { Faker::Lorem.words }
    description   { Faker::Lorem.paragraph }
    image         { Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/files/rails.png', 'image/png')
     }
  end
end
