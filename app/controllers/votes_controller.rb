class VotesController < ApplicationController
  def up
    @book = Book.find(params[:book_id])
    vote  = Vote.for(@current_user, @book)
    vote.up
    if vote.save
      flash[:notice] = "Up Vote has been recorded."
    else
      flash[:alert]  = vote.errors[:direction]
    end
    redirect_to @book
  end

  def down
    @book = Book.find(params[:book_id])
    vote  = Vote.for(@current_user, @book)
    vote.down
    if vote.save
      flash[:notice] = "Down Vote has been recorded."
    else
      flash[:alert]  = vote.errors[:direction]
    end
    redirect_to @book
  end
end
