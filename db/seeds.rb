# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(id: 3, name: "Willy Nelson", username: "willyboy", password: "GoGoGadget3")
User.create!(id: 5, name: "Danny DeVito", username: "danny_de_v", password: "jerseyMikesRox7")
User.create!(id: 7, name: "Dolly Parton", username: "dollyP", password: "Jolene123")
User.create!(id: 11, name: "Lionel Messi", username: "futbol_geek", password: "test123")
User.create!(id: 15, name: "Lord Farquaad", username: "coolguy", password: "frank2")