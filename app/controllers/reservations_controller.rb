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

  def check_out
    book = Book.find(params[:book_id])
    reservation = Reservation.for(:user => @current_user, :book => book)
    reservation.check_out
    if reservation.save
      flash[:notice] = "You have now checked out the book"
    else
      flash[:alert] = "Error: #{reservation.errors.full_messages.to_sentence}"
    end
    redirect_to :back
  end

  def check_in
    book = Book.find(params[:book_id])
    reservation = Reservation.for(:user => @current_user, :book => book)
    reservation.check_in
    if reservation.save
      flash[:notice] = "You have now checked in the book"
      @current_user.reload
    else
      flash[:alert] = "Error: #{reservation.errors.full_messages.to_sentence}"
    end
    redirect_to :back
  end
end
