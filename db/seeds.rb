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
puts "==========================================="
puts "Creating users..."
puts "==========================================="
10.times do
  new_user = User.new(
    username: Faker::Internet.username,
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
  # User.all.each do |user|
  # 3.times do
  #   new_venue = Venue.new(
  #     name: Faker::Company.name,
  #     address: Faker::Address.street_address,
  #     overview: Faker::Lorem.paragraph,
  #     user_id: user.id
  #   )
  #   puts new_venue.name
  #   new_venue.save!
  # end
transbo = URI.open("https://www.heurebleue.fr/wp-content/files_dnk/cache/7e6f4bb05446b6935b7583c8132db6e1_transbordeur_salle_lyon.jpg")
venue = Venue.new(
  name: "le Transbordeur",
  address: "3 Bd de Stalingrad, 69100 Villeurbanne",
  overview: "Le Transbordeur est une salle de concert consacrée aux musiques actuelles située à Villeurbanne, à proximité du Parc de la Tête d'Or et de la Cité Internationale.",
  user_id: random_user.id
)
venue.photo.attach(io: transbo, filename: "7e6f4bb05446b6935b7583c8132db6e1_transbordeur_salle_lyon.jpg", content_type: "image/jpg")
venue.save

kao = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Ninkasi_kao_Lyon7_fr.JPG/1280px-Ninkasi_kao_Lyon7_fr.JPG")
venue = Venue.new(
  name: "Ninkasi KAO",
  address: "267 Rue Marcel Mérieux, 69007 Lyon",
  overview: "Le Ninkasi Gerland, avec deux scènes de musiques actuelles, le Kafé et le Kao, est une des salles de concert emblématiques de lyon.
  Des concerts (pop, rock, électro, chanson..), soirées Djs, étudiantes ou d’entreprise y sont organisés toute l’année. Pour consulter le listing complet des concerts et des soirées, c’est par ici que ca se passe.",
  user_id: random_user.id
)
venue.photo.attach(io: kao, filename: "1280px-Ninkasi_kao_Lyon7_fr.JPG", content_type: "image/jpg")
venue.save

marche_gare = URI.open("https://cdn-s-www.leprogres.fr/images/A1A690DE-08E4-4821-827E-360124B3DCF9/NW_raw/le-portail-emblematique-du-marche-gare-transforme-en-salle-de-spectacle-reste-le-temoin-d-un-demi-siecle-de-marche-de-gros-photo-charles-yves-guyon-1488206087.jpg")
venue = Venue.new(
  name: "Le Marché Gare",
  address: "4-6 Pl. Hubert Mounier, 69002 Lyon",
  overview: "Salle de 300 places ouverte en 2007 accueillant des concerts de punk, disco, hip-hop et rap.",
  user_id: random_user.id
)
venue.photo.attach(io: marche_gare, filename: "le-portail-emblematique-du-marche-gare-transforme-en-salle-de-spectacle-reste-le-temoin-d-un-demi-siecle-de-marche-de-gros-photo-charles-yves-guyon-1488206087.jpg", content_type: "image/jpg")
venue.save

cco = URI.open("https://www.lyoncapitale.fr/wp-content/uploads/2014/05/449646-ez-Le-CCO-Jean-Pierre-Lachaize.png")
venue = Venue.new(
  name: "Le CCO",
  address: "39 Rue Georges Courteline, 69100 Villeurbanne",
  overview: "Le Centre culturel œcuménique Jean-Pierre-Lachaize ou CCO Villeurbanne et localement connu comme Le CCO, est un centre culturel créé en 1963 à Villeurbanne à proximité du campus universitaire de La Doua. Il a été nommé en l'honneur de Jean Pierre-Lachaize, un directeur qui fut investi dans la vie du centre.",
  user_id: random_user.id
)
venue.photo.attach(io: cco, filename: "449646-ez-Le-CCO-Jean-Pierre-Lachaize.png", content_type: "image/png")
venue.save

trokson = URI.open("https://upload.wikimedia.org/wikipedia/commons/0/0d/Le_Trokson%2C_Mont%C3%A9e_de_la_Grande_C%C3%B4te_%C3%A0_Lyon.JPG")
venue = Venue.new(
  name: "Le Trokson",
  address: "110 Mnt de la Grande-Côte, 69001 Lyon",
  overview: "Des groupes de rock se produisent sur la petite scène de ce bar à cocktails branché doté d'une grande cour extérieure.",
  user_id: random_user.id
)
venue.photo.attach(io: trokson, filename: "Le_Trokson%2C_Mont%C3%A9e_de_la_Grande_C%C3%B4te_%C3%A0_Lyon.JPG", content_type: "image/jpg")
venue.save

kraspek = URI.open("https://www.petit-bulletin.fr/multimedia/articles/170110_....multimediaarticles170109Krafacade.jpg")
venue = Venue.new(
  name: "Le Kraspek Myzik",
  address: "20 Mnt Saint-Sébastien, 69001 Lyon",
  overview: "Scène underground lyonnaise dédiée à la création et la diffusion des musiques actuelles & indépendantes.",
  user_id: random_user.id
)
venue.photo.attach(io: kraspek, filename: "170110_....multimediaarticles170109Krafacade.jpg")
venue.save
# end
puts "==========================================="
puts "Completed !"
puts "==========================================="

Booking.destroy_all
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
