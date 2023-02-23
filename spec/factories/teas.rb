FactoryBot.define do
  factory :tea do
    title { Faker::Movies::HarryPotter.character }
    description { Faker::Movies::HarryPotter.quote }
    temperature { Faker::Number.between(from: 90, to: 100) }
    brew_time { Faker::Number.between(from: 120, to: 212) }
  end
end