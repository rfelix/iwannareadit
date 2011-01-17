class BooksController < ApplicationController
  def index

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book has been suggested."
      redirect_to @book
    else
      flash[:alert] = "No Book has been suggested."
      render :action => "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def vote_up
    @book = Book.find(params[:id])
    if @book.vote_up(@current_user)
      flash[:notice] = "Up Vote has been recorded."
    else
      flash[:alert] = "You've already voted for this Book"
    end
    redirect_to @book
  end
end
