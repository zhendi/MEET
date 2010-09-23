class CommentsController < ApplicationController
  respond_to :html,:js

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(params[:comment])
    if @comment.save
		respond_with(@comment)
    else
		redirect_to blog_path(blog, :notice=>"保存失败")
    end
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    comment = blog.comments.find(params[:id])
	@comment_id = "comment_" + comment.id.to_s()
	
    comment.destroy
	
	respond_with(@comment_id)
  end
end
