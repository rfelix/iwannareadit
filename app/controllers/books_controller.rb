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
    @comment = Comment.new
    # FIXME Yuck, this is terrible... how else can this be done?
    if session[:comment_obj].present?
      @comment = session[:comment_obj]
      session[:comment_obj] = nil
    end
  end

end
