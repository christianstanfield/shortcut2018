class Vote < ApplicationRecord

  belongs_to :ballot
  belongs_to :film
  belongs_to :award

  scope :with_films_and_awards, -> {
    joins(:film, :award)
    .group('awards.name, films.name')
    .order('awards.name, count desc')
    .select('awards.name as award_name, films.name as film_name, count(films.*)')
  }
end
