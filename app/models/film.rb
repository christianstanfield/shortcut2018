class Film < ApplicationRecord

  has_many :votes
  has_many :considerations
  has_many :considered_awards, through: :considerations, source: :award
end
