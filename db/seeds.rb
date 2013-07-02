# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Scribe.destroy_all
Inquiry.destroy_all

puts 'Previous data destroyed.'

Scribe.create(first_name: 'Emily', last_name: 'Ellison', email: 'emily@fixitwithcode.com', password: 'password', password_confirmation: 'password')

puts 'Scribe created.'

20.times do
  Inquiry.create(name: Faker::Name.name, email: 'emily@fixitwithcode.com', message: Faker::Lorem.paragraph)
end

puts 'Inquiries created.'