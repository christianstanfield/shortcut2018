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

ASYLUM  = 'Asylum'
TINA    = 'Tina'
STRONG  = 'Strong Independent Women'
HOPE    = 'Hope is French'
SILVER  = 'Silence is Silver'
TOE     = 'Toe'
TATTOO  = 'The Tattooed Heart'
SWEPT   = 'Swept Away'
WAVES   = 'Waves'
COLLIDE = 'Collide'
MOVING  = 'Moving On'
YELLOW  = 'Mellow Yellow'

[ASYLUM, TINA, STRONG, HOPE, SILVER, TOE, TATTOO, SWEPT, WAVES, COLLIDE, MOVING, YELLOW].each do |film_name|
  Film.create! name: film_name
end

chicago = Award.find_by name: Award::CHICAGO
[TOE, WAVES, COLLIDE, YELLOW].each do |film_name|
  Film.find_by(name: film_name).considered_awards << chicago
end

female = Award.find_by name: Award::FEMALE
[TINA, STRONG, SWEPT, YELLOW].each do |film_name|
  Film.find_by(name: film_name).considered_awards << female
end

audience = Award.find_by name: Award::AUDIENCE
Film.all.each do |film|
  film.considered_awards << audience
end

200.times do
  Code.create! value: SecureRandom.hex(3)
end
