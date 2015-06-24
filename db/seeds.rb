# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Project.create!(
  name: 'spolisty.com', short_desc: 'Ruby on Rails',
  description: 'Poznawaj nowych ludzi poprzez swoje playlisty ze Spotify. Spolisty analizuje utwory znajdujące się na Twoich playlistach. Na podstawie zebranych danych spolisty wskazuje użytkowników o podobnych guście muzycznym.
   Logowanie do systemu odbywa się poprzez konto Spotify. Użytkownik ma możliwość przesłuchania utworów znajdujących się na playlistach oraz ocenienia danej playlist. Każdy z użytkowników może przeglądać utwory na podstawie wybranego gatunku muzycznego.',
  site: 'http://www.spolity.com',
  foto: File.new("#{Rails.root}/app/assets/images/spolisty.jpg").to_s
)

Project.create!(
  name: 'Tiefenbach Polska', short_desc: 'Bootstrap',
  description: 'Projekt witryny dla firmy Tiefenbach Polska SA',
  site: 'http://www.tiefenbach.com.pl',
  foto: File.new("#{Rails.root}/app/assets/images/tief-mini.jpg").to_s
)

Project.create!(
  name: 'Netguru workshop', short_desc: 'Ruby on Rails / Bootstrap',
  description: 'Aplikacja stworzona na warsztaty Netguru, odbywające się w Krakowie w 2015 roku.',
  site: "https://tpanek-workshops-gliwice.herokuapp.com/",
  foto: File.new("#{Rails.root}/app/assets/images/workshop.jpg").to_s
)

Project.create!(
  name: 'Make it', short_desc: 'Ruby on Rails / React',
  description: 'Prosta aplikacja wspomagająca organizację pracy.',
  site: "https://tpanek-workshops-gliwice.herokuapp.com/",
  foto: File.new("#{Rails.root}/app/assets/images/workshop.jpg").to_s
)