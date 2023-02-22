FactoryBot.define do
  factory :subscription do
    tea
    customer

    title { Faker::Tea.variety }
    price { Faker::Number.between(from: 500, to: 100) }
    status { rand(0..1) }
    frequency { [7, 14, 21, 30, 60].sample }
  end
end