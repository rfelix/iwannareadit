class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @book    = Book.find(params[:book_id])

    @comment.book = @book
    @comment.user = @current_user

    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to @book
    else
      flash[:alert]  = "Error in comment."
      # FIXME Yuck, this is terrible... how else can this be done?
      session[:comment_obj] = @comment
      redirect_to @book
    end
  end
end
