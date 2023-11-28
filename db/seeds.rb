# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(email: "email10@email.fr", password: "azerty1", username: "user10")
User.create!(email: "email20@email.fr", password: "azerty2", username: "user20")
User.create!(email: "email30@email.fr", password: "azerty3", username: "user30")

Post.create!(mood: "hope", track_id: "To you", user_id: 1)
Post.create!(mood: "sad", track_id: "Gather my tears", user_id: 2)
Post.create!(mood: "Happy", track_id: "Super", user_id: 1)

Comment.create!(content: "Best song ever!!", post_id: 1, user_id: 2)
Comment.create!(content: ":(((", post_id: 2, user_id: 3)
Comment.create!(content: "Yeahhhh", post_id: 3, user_id: 1)
