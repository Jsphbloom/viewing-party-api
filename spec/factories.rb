FactoryBot.define do
  factory :movie do
    id { Faker::Number.number(digits: 2)}
    title { Faker::Fantasy::Tolkien}
    vote_average { Faker::Number.decimal(l_digits: 2) }
  end
end