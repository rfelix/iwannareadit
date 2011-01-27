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
  end

  def create
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
    # FIXME Yuck, this is terrible... how else can this be done?
    if session[:comment_obj].present?
      @comment = session[:comment_obj]
      session[:comment_obj] = nil
    end
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
end
