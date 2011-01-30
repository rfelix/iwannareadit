class ReservationsController < ApplicationController
  def index
    @books = @current_user.reservations.map(&:book)
  end

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

  def destroy
    book = Book.find(params[:book_id])
    reservation = Reservation.for(:user => @current_user, :book => book)
    reservation.destroy
    flash[:notice] = "Your reservation has been released."
    redirect_to :back
  end
end
