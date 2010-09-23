class CoursesController < ApplicationController
  respond_to :html, :js

  def index
    @all_courses = Course.all #.paginate :page=>5, :order=>"created_at desc"
    @rated_courses = Course.paginate  :page => params[:page]
  end

  def new
    @course = Course.new()
    respond_with(@course)
  end

  def show
    @course = Course.find(params[:id])

    respond_with(@course)
  end

  def create
    @course = Course.new(params[:course])
    @course.level = Level.find(params[:level])
    @course.category = Category.find(params[:category])
    @course.teacher = Teacher.first

    if @course.save
      respond_with(@course)
    end
  end

  def edit
    @course = Course.find(params[:id])
    respond_with(@course)	
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(parsms[:course])
      redirect_to :action=>"index", :notice=>"Update Succeed"
    else
      render	:action=>:edit, :notice=>"Update Failed"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to	:action=>"index", :notice=>"Destroy Succeed"
    end
  end

  def collect
    course = Course.find(params[:id])
    current_user.collected_courses << course
    
    logger.info("add succeed #{current_user.collected_courses.count}")
    redirect_to :action=>"index"
  end
end
