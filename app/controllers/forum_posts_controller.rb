class ForumPostsController < ApplicationController
  respond_to  :html, :js

  def create
    @topic = Topic.find(params[:topic_id])
    @forum_post = @topic.forum_posts.build(params[:forum_post])
    @forum_post.user = current_user

    if @forum_post.save
      respond_with(@topic,@forum_post)
    else
      redirect_to topic_forum_post_path(@topic, @forum_post)
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @forum_post = @topic.forum_posts.find(params[:id])

    @forum_post.destroy

    respond_with(@forum_post)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @forum_post = @topic.forum_posts.find(params[:id])

    respond_with(@forum_post) 
  end
end
