class CommentsController < ApplicationController
  respond_to :html,:js

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
    else
      render :action => 'new'
    end
  end

  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    @comment_id = "comment_#{@comment.id}"
    if @comment.destroy
      flash[:notice] = "Successfully deleted"
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
