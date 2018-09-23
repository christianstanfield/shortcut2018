class Ballot < ApplicationRecord

  has_many :votes, dependent: :destroy

  validates_presence_of :code
  validates_uniqueness_of :code, message: 'has already been used'
  validates :code, inclusion: { in: Code.pluck(:value),
    message: "%{value} is not a valid code" }

  attr_accessor :voting_selections

  before_save :save_votes

  def save_votes
    selections    = parse_considerations
    invalid_votes = invalid_selections selections

    if invalid_votes.present?
      invalid_votes.each do |award, films|
        errors.add :base, "Please select #{award.selectable_options} #{'option'.pluralize(award.selectable_options)} for the #{award.name} Award"
      end

      throw :abort
    elsif selections.length != Award.count
      errors.add :base, 'Make sure you have selected the correct number of films for each award'

      throw :abort
    else
      selections.each do |award, films|
        films.each do |film|
          votes.new award: award, film: film
        end
      end
    end
  end

  def invalid_selections selections
    selections.select do |award, films|
      award.selectable_options != films.length
    end
  end

  def parse_considerations
    selected_votes = voting_selections.select do |award_and_film, selected|
      selected == '1'
    end

    considerations = {}

    selected_votes.each do |award_and_film, selected|
      award_and_film = award_and_film.split('-')

      award = award_and_film.first
      award = Award.find award.split('_').last

      film = award_and_film.last
      film = Film.find film.split('_').last

      if considerations[award]
        considerations[award] << film
      else
        considerations[award] = [film]
      end
    end

    considerations
  end
end
