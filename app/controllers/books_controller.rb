class BooksController < ApplicationController
  def index
    @books = Book.find(:all).sort_by { |b| Vote.count_for(b) }.reverse
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
    @vote = Vote.for(@current_user, @book)
  end

end
