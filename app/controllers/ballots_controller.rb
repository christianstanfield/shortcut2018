class BallotsController < ApplicationController

  def new
    @ballot = Ballot.new
  end

  def create
    @ballot = Ballot.new(ballot_params)
    @ballot.voting_selections = vote_params

    if @ballot.save
      redirect_to @ballot, notice: 'Ballot was successfully submitted.'
    else
      render :new
    end
  end

  def show
    @ballot = Ballot.find(params[:id])
  end

  private

  def ballot_params
    params.require(:ballot).permit(:code)
  end

  def vote_params
    params.dig(:ballot, :votes_attributes)
  end
end
