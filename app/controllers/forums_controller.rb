class ForumsController < ApplicationController
  respond_to :html, :js

  def index
    @forums = Forum.find(:all)

    respond_with(@forums)
  end

  def show
    @forums = Forum.find(:all)
    @forum = Forum.find(params[:id])
    @topics = @forum.topics.paginate :page => params[:page], :order=>"created_at DESC"

    respond_with(@forum)
  end

  def new
    @forum = Forum.new()
    respond_with(@forum)
  end

  def create
    @forum = Forum.new(params[:forum])
    respond_to do |wants|
      if @forum.save
        wants.html  {redirect_to  forums_path, :notice=>"create succssed"}
      else
        wants.html  {render :action=>:new}
      end
    end
  end

  def edit
    @forum = Forum.find(params[:id])
    respond_with(@forum)
  end

  def update
    @forum = Forum.find(params[:id])
    respond_to do |wants|
      if @forum.update_attributes(params[:forum])
        wants.html  {redirect_to  forums_path, :notice=>"update succeed"}
      else
        wants.html  {render :action=>"edit"}
      end
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    if @forum.destroy
      redirect_to forums_path, :notice=>"delete succeed"
    else
      render  forums_path, :error=>"delete failed"
    end
  end
end
