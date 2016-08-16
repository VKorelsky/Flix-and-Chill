# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 # require 'Date'
Review.destroy_all
Booking.destroy_all
Projection.destroy_all
User.destroy_all



films = [
"Forrest Gump",
"La Ligne verte",
"Django Unchained",
"La Liste de Schindler",
"Gran Torino",
"The Dark Knight, Le Chevalier Noir",
"Le Parrain",
"Pulp Fiction",
"12 hommes en colère",
"Le Seigneur des anneaux : le retour du roi",
"Fight Club",
"Les Evadés",
"Mommy",
"Le Roi Lion",
"Le Seigneur des anneaux : la communauté de l'anneau" ]

status = [
  "pending",
  "accepted"
]

20.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  # birthday = Faker::Date.between(40.years.ago, 15.years.ago)
  email = Faker::Internet.free_email("#{first_name}.#{last_name}")

  user = User.create({

    email: email,
    password: Faker::Internet.password(10, 20),
    first_name: first_name,
    last_name: last_name,
    # birthday: birthday,
    description: Faker::StarWars.quote

    })
end

User.all.each do |user|

  date = Faker::Date.between(7.days.ago, 14.days.from_now)
  address = Faker::Address.city

  (0..3).to_a.sample.times do
  projection = Projection.create(name: Faker::StarWars.quote, user: user, date: date, address: address, movie: films.sample, capacity: (3..20).to_a.sample)

    (0..projection.capacity).to_a.sample.times do

      random_user = User.order("RANDOM()").first

      while random_user == user
        random_user = User.order("RANDOM()").first
      end

      if projection.date >= Date.today
        booking = Booking.create(projection: projection, status: "accepted", user: random_user)
      else
        booking = Booking.create(projection: projection, status: status.sample)
      end

      content = Faker::Hacker.say_something_smart
      Review.create(content: content, rating: (0..5).to_a.sample, booking: booking)

    end
  end
end




