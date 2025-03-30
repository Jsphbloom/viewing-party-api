FactoryBot.define do
  factory :viewing_party_invitee do
    viewing_party { nil }
    user { nil }
  end

  factory :viewing_party do
    name { "MyString" }
    start_time { "2025-03-30 10:15:45" }
    end_time { "2025-03-30 10:15:45" }
    movie_id { 1 }
    movie_title { "MyString" }
    host_id { 1 }
  end

  factory :movie do
    id { Faker::Number.number(digits: 2)}
    title { Faker::Fantasy::Tolkien}
    vote_average { Faker::Number.decimal(l_digits: 2) }
  end
end