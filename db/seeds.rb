# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Consideration.delete_all
Vote.delete_all
Award.delete_all
Film.delete_all
Code.delete_all
Ballot.delete_all

[Award::CHICAGO, Award::FEMALE, Award::AUDIENCE].each do |award_name|
  Award.create! name: award_name
end

ROMEO    = 'The Untold Story of Romeo & Juliet'
FUPA     = 'FUPA'
ENOUGH   = 'ENOUGH | The Empowered Women of Korogocho'
AKASHI   = 'AKASHI'
NOISE    = 'The Noise of the Light'
ONION    = 'Spanish Onion'
HOUSE    = 'The House'
PONYTAIL = 'Ponytail'
BLUE     = 'Bliss Blue'
ACTING   = 'Acting Her Age'
HAMMER   = 'HAMMERSMITH: Hurdle of Dreams'

[ROMEO, FUPA, ENOUGH, AKASHI, NOISE, ONION, HOUSE, PONYTAIL, BLUE, ACTING, HAMMER].each do |film_name|
  Film.create! name: film_name
end

chicago = Award.find_by name: Award::CHICAGO
[FUPA, PONYTAIL, BLUE, HAMMER].each do |film_name|
  Film.find_by(name: film_name).considered_awards << chicago
end

female = Award.find_by name: Award::FEMALE
[AKASHI, HOUSE, PONYTAIL, BLUE, ACTING].each do |film_name|
  Film.find_by(name: film_name).considered_awards << female
end

audience = Award.find_by name: Award::AUDIENCE
Film.all.each do |film|
  film.considered_awards << audience
end

200.times do
  Code.create! value: SecureRandom.hex(3)
end
