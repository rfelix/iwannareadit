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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment successfully edited."
      redirect_to @comment.book
    else
      flash.now[:notice] = "Error in saving comment."
      render :action => 'edit'
    end
  end

  def destroy
    c = Comment.find(params[:id])
    c.destroy
    flash[:notice] = "Comment has been deleted."
    redirect_to c.book
  end
end
