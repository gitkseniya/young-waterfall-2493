FactoryBot.define do
  factory :movie, class: Movie do
    title { Faker::Name.name }
    creation_year { Faker::Number.between(from: 1999, to: 2020) }
    genre { ["horror", "action", "drama", "romance"].sample }
    association :studio, factory: :studio
  end
end
