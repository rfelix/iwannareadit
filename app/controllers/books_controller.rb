class BooksController < ApplicationController
  def index

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.save
    flash[:notice] = "Book has been suggested."
    redirect_to @book
  end

  def show
    @book = Book.find(params[:id])
  end
end
