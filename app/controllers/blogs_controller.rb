class BlogsController < ApplicationController
  respond_to :html,:js
  before_filter	:tag_cloud

  def index
    @blogs = Blog.paginate :page => params[:page], :order => 'created_at DESC'

    respond_with(@blogs)
  end

  def new
    @blog = Blog.new()
    respond_with(@blog)
  end

  def create
    @blog = Blog.new(params[:blog])
    respond_to	do |f|
      if @blog.save
        f.html	{redirect_to  :action=>:index, :notice=>"create succssed"}
      else
        f.html	{render :action=>:new}
      end
    end
  end

  def show
    @blog = Blog.find(params[:id])
    respond_with(@blog)
  end

  def edit
    @blog = Blog.find(params[:id])
    respond_with(@blog)
  end

  def update
    @blog = Blog.find(params[:id])
    respond_to do |wants|
      if @blog.update_attributes(params[:blog])
        wants.html  {redirect_to  @blog,
          :notice=>"update succeed"}
      else
        wants.html  {render :action=>"edit"}
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_with(@blog, :notice=>"destroy succeed")
  end

  def tag_cloud
    @tags = Blog.tag_counts_on(:tags)
  end
end
