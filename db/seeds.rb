# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do 
  Customer.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.safe_email, 
    address: Faker::Address.full_address )
end

10.times do 
  Tea.create!(
    title: Faker::Movies::HarryPotter.character,  
    description: Faker::Movies::HarryPotter.quote, 
    temperature: Faker::Number.between(from: 90, to: 100), 
    brew_time: Faker::Number.between(from: 120, to: 212))
end

#1
Subscription.create!(
  title: Tea.first.title,
  price: Faker::Number.between(from: 500, to: 100),
  status: 0,
  frequency: [7, 14, 21, 30, 60].sample,
  tea_id: Tea.first.id,
  customer_id: Customer.first.id
)

# #2
Subscription.create!(
  title: Tea.second.title,
  price: Faker::Number.between(from: 500, to: 100),
  status: 0,
  frequency: [7, 14, 21, 30, 60].sample,
  tea_id: Tea.first.id,
  customer_id: Customer.second.id
)

# #3
Subscription.create!(
  title: Tea.third.title,
  price: Faker::Number.between(from: 500, to: 100),
  status: 0,
  frequency: [7, 14, 21, 30, 60].sample,
  tea_id: Tea.second.id,
  customer_id: Customer.first.id
)

# #4
Subscription.create!(
  title: Tea.second.title,
  price: Faker::Number.between(from: 500, to: 100),
  status: 0,
  frequency: [7, 14, 21, 30, 60].sample,
  tea_id: Tea.second.id,
  customer_id: Customer.third.id
)