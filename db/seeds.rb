# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 # require 'Date'

date = Date.today

ronald = User.create(email: "ronald@fake.com", password: "ronald", first_name: "Ronald", birth_date: date)
daisy = User.create(email: "daisy@fake.com", password: "daisyisthebitch", first_name: "Daisy", birth_date: date)
batman = User.create(email: "batman@fake.com", password: "batman", first_name: "Batman", birth_date: date)

Projection.create(user: ronald, date: date, address: "16 villa gaudelet", movie: "Lord of the rings")

Booking.create(projection_id: 1, status: "accepted", user_id: 2)

Review.create(content: "Loved it was super super super super amazing", rating: 5, booking_id: 1)



