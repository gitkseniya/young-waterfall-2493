FactoryBot.define do
  factory :actor, class: Actor do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 20, to: 60) }
    currently_working { Faker::Boolean.boolean }
  end
end
