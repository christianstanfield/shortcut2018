class Award < ApplicationRecord

  CHICAGO  = 'Shot in Chicago'
  FEMALE   = 'Female Filmmaker'
  AUDIENCE = 'Audience'

  has_many :votes
  has_many :considerations
  has_many :considered_films, through: :considerations, source: :film

  def selectable_options
    name == AUDIENCE ? 2 : 1
  end
end
