FactoryBot.define do
  factory :viewing_party_invitee do
    viewing_party { nil }
    user { nil }
  end

  factory :viewing_party do
    name {"Juliet's Bday Movie Bash!"}
    start_time {"2025-02-01 10:00:00"}
    end_time {"2025-02-01 14:30:00"}
    movie_id {278}
    movie_title {"The Shawshank Redemption"}
    host_id {3}
  end

  factory :movie do
    id { Faker::Number.number(digits: 2)}
    title { Faker::Fantasy::Tolkien}
    vote_average { Faker::Number.decimal(l_digits: 2) }
  end

  factory :user do
    id { Faker::Number.number(digits: 2)}
    name { Faker::Name.name}
    username { Faker::Superhero.descriptor }
    password { Faker::Number.number(digits: 4 ).to_s}
  end
end