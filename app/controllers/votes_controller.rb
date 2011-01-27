class VotesController < ApplicationController
  def up
    make_vote :up
  end

  def down
    make_vote :down
  end

  private

  def make_vote(direction)
    @book = Book.find(params[:book_id])
    vote  = Vote.for(@current_user, @book)
    vote.send direction
    if vote.save
      flash[:notice] = "#{direction.to_s.capitalize} Vote has been recorded."
    else
      flash[:alert]  = vote.errors[:direction]
    end
    redirect_to :back
  end
end
