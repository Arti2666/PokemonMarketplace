# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

# Decomment to launch user creation
user1 = { username: "Ash", email: "Ash@Kanto.com", password: "123456" }
user2 = { username: "Brock", email: "Brock@Kanto.com", password: "123456" }
user3 = { username: "Misty", email: "Misty@Kanto.com", password: "123456" }
user4 = { username: "Red", email: "Red@Kanto.com", password: "123456" }

[user1, user2, user3, user4].each do |attributes|
user = User.create!(attributes)
puts "Created #{user.username}"
end
puts "Finished Users!"

puts "Creating pokemons..."
bulbasaur = { name: "Bulbasaur", type1: "Grass", type2: "Poison", user_id: User.all.sample.id, price: 5, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png" }
ivysaur = { name: "Ivysaur", type1: "Grass", type2: "Poison", user_id: User.all.sample.id, price: 16, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png" }
venusaur = { name: "Venusaur", type1: "Grass", type2: "Poison", user_id: User.all.sample.id, price: 32, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png" }
charmander = { name: "Charmander", type1: "Fire", user_id: User.all.sample.id, price: 5, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png" }
charmeleon = { name: "Charmeleon", type1: "Fire", user_id: User.all.sample.id, price: 16, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png" }
charizard = { name: "Charizard", type1: "Fire", type2: "Flying", price: 36, user_id: User.all.sample.id, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png" }
squirtle = { name: "Squirtle", type1: "Water", user_id: User.all.sample.id, price: 5, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png" }
wartortle = { name: "Wartortle", type1: "Water", user_id: User.all.sample.id, price: 16, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png" }
blastoise = { name: "Blastoise", type1: "Water", user_id: User.all.sample.id, price: 36, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png" }
pikachu = { name: "Pikachu", type1: "Electric", user_id: User.all.sample.id, price: 20, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" }
arcanine = { name: "Arcanine", type1: "Fire", user_id: User.all.sample.id, price: 40, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/059.png" }
gengar = { name: "Gengar", type1: "Ghost", type2: "Poison", user_id: User.all.sample.id, price: 45, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png" }
lapras = { name: "Lapras", type1: "Water", type2: "Ice", user_id: User.all.sample.id, price: 45, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/131.png" }
dragonite = { name: "Dragonite", type1: "Dragon", type2: "Flying", user_id: User.all.sample.id, price: 45, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/149.png" }
mewtwo = { name: "Mewtwo", type1: "Psychic", user_id: User.all.sample.id, price: 50, image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png" }

[bulbasaur, ivysaur, venusaur, charmander, charmeleon,
charizard, squirtle, wartortle, blastoise, pikachu,
arcanine, gengar, lapras, dragonite, mewtwo].each do |attributes|
  pokemon = Pokemon.create!(attributes)
  puts "Created #{pokemon.name}"
end
puts "Finished!"
