class VotesController < ApplicationController
  def up
    make_vote Vote::UP
  end

  def down
    make_vote Vote::DOWN
  end

  private

  def make_vote(direction)
    @book = Book.find(params[:book_id])
    vote  = Vote.for(@current_user, @book)
    direction == Vote::UP ? vote.up : vote.down
    if vote.save
      direction_str = direction == Vote::UP ? "Up" : "Down"
      flash[:notice] = "#{direction_str} Vote has been recorded."
    else
      flash[:alert]  = vote.errors[:direction]
    end
    redirect_to :back
  end
end
