class TopicsController < ApplicationController
  respond_to :html, :js

  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics

    respond_with(@topics)
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build()
  end

  def show
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id])

    respond_with(@forum, @topic)
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    if @topic.save
      respond_with([@forum,@topic])
    else
      redirect_to forum_topic_path(@forum, @topic, :notice=>"save failed")
    end
  end


  def update
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to forum_topic_path(@forum, @topic, :notice=>"update succeed")
    else
      render edit_forum_topic_path(@forum, @topic, :error=>"update failed")
    end
  end

  # 需要做动态的效果来实现
  def delete
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id])
    
    respond_with(@topic)
  end
    
end
