# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
User.all.each do |user|
  3.times do
    new_venue = Venue.new(
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      overview: Faker::Lorem.paragraph,
      user_id: user.id
    )
    puts new_venue.name
    new_venue.save!
  end
end
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
