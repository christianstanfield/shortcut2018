class Vote < ApplicationRecord

  belongs_to :ballot
  belongs_to :film
  belongs_to :award
end
