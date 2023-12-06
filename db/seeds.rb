# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.destroy_all
User.destroy_all

print "création des users"
helena = User.create!(email: "helena@gmail.com", password: "azerty", username: "Helena", picture: "https://images.pexels.com/photos/1547971/pexels-photo-1547971.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
marta = User.create!(email: "marta@gmail.com", password: "azerty", username: "Marta", picture: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
leo = User.create!(email: "leo@gmail.com", password: "azerty", username: "Léo", picture: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
marcelo = User.create!(email: "marcelo@gmail.com", password: "azerty", username: "Marcelo", picture: "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
andrea = User.create!(email: "andrea@gmail.com", password: "azerty", username: "Andrea", picture: "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
jade = User.create!(email: "jade@gmail.com", password: "azerty", username: "Jade", picture: "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
roberto = User.create!(email: "roberto@gmail.com", password: "azerty", username: "Robert", picture: "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
marc = User.create!(email: "marc@gmail.com", password: "azerty", username: "Marc", picture: "https://images.pexels.com/photos/1462980/pexels-photo-1462980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
esmeralda = User.create!(email: "esmeralda@gmail.com", password: "azerty", username: "Esmeralda", picture: "https://images.pexels.com/photos/2460227/pexels-photo-2460227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

print "création des posts"

print "it's donnnnnnnnne"
