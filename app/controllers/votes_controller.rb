class VotesController < ApplicationController
  def up
    @book = Book.find(params[:book_id])
    vote  = Vote.for(@current_user, @book)
    vote.up
    if vote.save
      flash[:notice] = "Up Vote has been recorded."
    else
      flash[:alert]  = "You've already up voted this Book"
    end
    redirect_to @book
  end

  def down
  end
end
