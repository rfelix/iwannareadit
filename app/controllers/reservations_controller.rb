class ReservationsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    reservation = Reservation.new(:user => @current_user, :book => book)
    if reservation.save
      flash[:notice] = "The book has successfully been reserved."
    else
      flash[:alert] = "Error: #{reservation.errors.full_messages.to_sentence}"
    end
    redirect_to :back
  end
end
