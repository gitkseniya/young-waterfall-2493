FactoryBot.define do
  factory :studio, class: Studio do
    name { Faker::Name.last_name }
    location { Faker::Address.full_address }
  end
end
