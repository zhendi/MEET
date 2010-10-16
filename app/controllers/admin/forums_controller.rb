class Admin::ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save()
      redirect_to :action=>"index", :notice=>t(:create_succeed, :scope=>[:common], :name=>@forum.name)
    else
      render  :action=>"new", :error=>t(:create_failed, :scope=>[:common], :name=>@forum.id)
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to :action=>"index", :notice=>t(:update_succeed, :scope=>[:common], :name=>@forum.name)
    else
      render  :action=>"new"#, :error=>t(:update_failed, :scope=>[:common], :name=>@forum.id)
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    name_id = @forum.name
    if @forum.destroy
      redirect_to "index", :error=>t(:delete_succeed,:scoppe=>[:common],:name=>name_id)
    else
      redirect_to "index", :error=>t(:delete_failed, :scope=>[:common], :name=>name_id)
    end
  end
end
