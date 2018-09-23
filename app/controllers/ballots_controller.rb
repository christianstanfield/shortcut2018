class BallotsController < ApplicationController

  http_basic_authenticate_with name: 'cs', password: 'tacos4ever', only: :results

  def new
    @ballot = Ballot.new
    @awards = Award.all.includes(:considered_films)
  end

  def create
    @ballot = Ballot.new(ballot_params)
    @ballot.voting_selections = vote_params

    if @ballot.save
      redirect_to @ballot, notice: 'Ballot was successfully submitted.'
    else
      @awards = Award.all.includes(:considered_films)
      render :new
    end
  end

  def show
    @ballot = Ballot.find(params[:id])
  end

  def results
    @votes = Vote.with_films_and_awards
  end

  private

  def ballot_params
    params.require(:ballot).permit(:code)
  end

  def vote_params
    params.dig(:ballot, :votes_attributes)
  end
end
