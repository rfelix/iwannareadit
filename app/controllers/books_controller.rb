class BooksController < ApplicationController
  def index
    @books = Book.not_bought.all.sort_by { |b| Vote.count_for(b) }.reverse
  end

  def bought
    @books = Book.bought
    render :action => 'index'
  end

  def new
    @book = Book.new
    @book.authors = [Author.new, Author.new, Author.new]
  end

  def create
    remove_empty_authors_from_params
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book has been suggested."
      redirect_to @book
    else
      flash.now[:alert] = "No Book has been suggested."
      render :action => "new"
    end
  end

  def show
    @book = Book.find(params[:id])
    @vote = Vote.for(@current_user, @book)
    @comment = Comment.new
  end

  def mark_bought
    toggle_bought(true)
  end

  def unmark_bought
    toggle_bought(false)
  end

  private

  def toggle_bought(bought)
    @book = Book.find(params[:book_id])
    @book.is_bought = bought
    if @book.save
      flash[:notice] = "Book has been #{bought ? "" : "un"}marked as bought."
      redirect_to @book
    else
      flash.now[:alert] = "Error in marking book as #{bought ? "" : "un"}bought."
      render :action => 'show'
    end
  end

  def remove_empty_authors_from_params
    cleanup = {}
    params['book']['authors_attributes'].each do |k, author|
      cleanup[k] = author unless author['full_name'].split.blank?
    end
    # If everything is empty then we will just leave things as is
    # so that the user can then fill in the information
    params['book']['authors_attributes'] = cleanup unless cleanup.empty?
  end
end
