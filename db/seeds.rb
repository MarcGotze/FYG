# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

User.destroy_all
Venue.destroy_all
Booking.destroy_all
puts "==========================================="
puts "Creating users..."
puts "==========================================="
10.times do
  new_user = User.new(
    username: Faker::Music::RockBand.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: User::ROLE.sample
  )
  puts new_user.username
  new_user.save!
end
puts "==========================================="
puts "Creating venues..."
puts "==========================================="
users = User.all.to_a
random_user = users.sample

transbo = URI.open("https://www.heurebleue.fr/wp-content/files_dnk/cache/7e6f4bb05446b6935b7583c8132db6e1_transbordeur_salle_lyon.jpg")
venue = Venue.new(
  name: "le Transbordeur",
  address: "3 Bd de Stalingrad, 69100 Villeurbanne",
  overview: "Le Transbordeur is a concert venue dedicated to contemporary music located in Villeurbanne, near the Parc de la Tête d'Or and the Cité Internationale.",
  user_id: random_user.id
)
venue.photo.attach(io: transbo, filename: "7e6f4bb05446b6935b7583c8132db6e1_transbordeur_salle_lyon.jpg", content_type: "image/jpg")
venue.save
puts venue.name

kao = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Ninkasi_kao_Lyon7_fr.JPG/1280px-Ninkasi_kao_Lyon7_fr.JPG")
venue = Venue.new(
  name: "Ninkasi KAO",
  address: "267 Rue Marcel Mérieux, 69007 Lyon",
  overview: "Ninkasi Gerland, with two stages for contemporary music, the Kafé and the Kao, is one of Lyon's iconic concert venues. Concerts (pop, rock, electronic, chanson, etc.), DJ nights, student gatherings, and corporate events are organized there throughout the year. To check out the complete list of concerts and events, this is where you need to go.",
  user_id: random_user.id
)
venue.photo.attach(io: kao, filename: "1280px-Ninkasi_kao_Lyon7_fr.JPG", content_type: "image/jpg")
venue.save
puts venue.name

marche_gare = URI.open("https://cdn-s-www.leprogres.fr/images/A1A690DE-08E4-4821-827E-360124B3DCF9/NW_raw/le-portail-emblematique-du-marche-gare-transforme-en-salle-de-spectacle-reste-le-temoin-d-un-demi-siecle-de-marche-de-gros-photo-charles-yves-guyon-1488206087.jpg")
venue = Venue.new(
  name: "Le Marché Gare",
  address: "4-6 Pl. Hubert Mounier, 69002 Lyon",
  overview: "A 300-capacity venue opened in 2007, hosting punk, disco, hip-hop, and rap concerts.",
  user_id: random_user.id
)
venue.photo.attach(io: marche_gare, filename: "le-portail-emblematique-du-marche-gare-transforme-en-salle-de-spectacle-reste-le-temoin-d-un-demi-siecle-de-marche-de-gros-photo-charles-yves-guyon-1488206087.jpg", content_type: "image/jpg")
venue.save
puts venue.name

cco = URI.open("https://www.lyoncapitale.fr/wp-content/uploads/2014/05/449646-ez-Le-CCO-Jean-Pierre-Lachaize.png")
venue = Venue.new(
  name: "Le CCO",
  address: "39 Rue Georges Courteline, 69100 Villeurbanne",
  overview: "Le CCO is a cultural center established in 1963 in Villeurbanne, near the La Doua university campus. It was named in honor of Jean Pierre-Lachaize, a director who was deeply involved in the center's activities.",
  user_id: random_user.id
)
venue.photo.attach(io: cco, filename: "449646-ez-Le-CCO-Jean-Pierre-Lachaize.png", content_type: "image/png")
venue.save
puts venue.name

trokson = URI.open("https://upload.wikimedia.org/wikipedia/commons/0/0d/Le_Trokson%2C_Mont%C3%A9e_de_la_Grande_C%C3%B4te_%C3%A0_Lyon.JPG")
venue = Venue.new(
  name: "Le Trokson",
  address: "110 Montée de la Grande-Côte, 69001 Lyon",
  overview: "Rock bands perform on the small stage of this trendy cocktail bar with a spacious outdoor courtyard.",
  user_id: random_user.id
)
venue.photo.attach(io: trokson, filename: "Le_Trokson%2C_Mont%C3%A9e_de_la_Grande_C%C3%B4te_%C3%A0_Lyon.JPG", content_type: "image/jpg")
venue.save
puts venue.name

kraspek = URI.open("https://www.petit-bulletin.fr/multimedia/articles/170110_....multimediaarticles170109Krafacade.jpg")
venue = Venue.new(
  name: "Le Kraspek Myzik",
  address: "20 Montée Saint-Sébastien, 69001 Lyon",
  overview: "An underground scene in Lyon dedicated to the creation and promotion of contemporary and independent music",
  user_id: random_user.id
)
venue.photo.attach(io: kraspek, filename: "170110_....multimediaarticles170109Krafacade.jpg")
venue.save
puts venue.name

farmer = URI.open("https://www.nightfallcards.fr/wp-content/uploads/2020/01/farmer-2.jpg")
venue = Venue.new(
  name: "Le Farmer",
  address: "14 Montée des Carmélites, 69001 Lyon",
  overview: "Rock concert venue in Lyon.",
  user_id: random_user.id
)
venue.photo.attach(io: farmer, filename: "farmer-2.jpg")
venue.save
puts venue.name

grrrnd_zero = URI.open("https://www.rue89lyon.fr/wp-content/uploads/2019/06/IMG_0035.jpg")
venue = Venue.new(
  name: "Grrrnd Zero",
  address: "60 Av. de Bohlen, 69120 Vaulx-en-Velin",
  overview: "Independent concert venue and association in Lyon / Vaulx-en-Velin for concerts, events, and hosting of associations and artists.",
  user_id: random_user.id
)
venue.photo.attach(io: grrrnd_zero, filename: "IMG_0035.jpg")
venue.save
puts venue.name

radiant_bellevue = URI.open("https://www.oubruncher.com/photos1/2218_1.jpg")
venue = Venue.new(
  name: "Radiant Bellevue",
  address: "1 Rue Jean Moulin, 69300 Caluire-et-Cuire",
  overview: "The Radiant-Bellevue is a cultural complex in the city of Caluire-et-Cuire in the Lyon metropolis",
  user_id: random_user.id
)
venue.photo.attach(io: radiant_bellevue, filename: "2218_1.jpg")
venue.save
puts venue.name
# end
puts "==========================================="
puts "Creating bookings..."
puts "==========================================="

users = User.all
venues = Venue.all

start_date_range = Date.today..(Date.today + 30.days)
end_date_range = start_date_range.to_a.sample(1)

venues.each do |venue|
  users.sample(2).each do |user|
    end_date_range.each do |end_date|
      start_date = rand(start_date_range.begin..(end_date - 1.day))
      new_booking = Booking.new(
        user: user,
        venue: venue,
        start_date: start_date,
        end_date: end_date
      )
      puts "Booking by #{user.username} for #{venue.name} from #{start_date} to #{end_date}"
      new_booking.save!
    end
  end
end

puts "==========================================="
puts "Completed !"
puts "==========================================="
