class CoursesController < ApplicationController
  respond_to :html,:js

  def index
    @categories = CourseCategory.all
  end

  def new
    @course = Course.new()
    @category = CourseCategory.find(params[:category_id])

    if params[:school_id]
      @school = School.find(params[:school_id])
    end

    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end

    respond_with(@course)
  end

  def show
    @course = Course.find(params[:id])

    respond_with(@course)
  end

  def create
    @course = Course.new(params[:course])
    @course.level = Level.find(params[:level])
    @course.category = CourseCategory.find(params[:category])
    @course.author = current_user

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
    @course = Course.find(params[:id])
    current_user.collected_courses << @course

    respond_with(@course)
  end

  def uncollect
    @course = Course.find(params[:id])
    current_user.collected_courses.delete(@course)

    respond_with(@course)
  end

  # 列出某个大类中的所有的Subject以及学校
  def list
    @categories = CourseCategory.all
    @category = CourseCategory.find(params[:id])
    @subjects = @category.subjects.roots
    @schools = @category.schools
  end

  def show_school
    @categories = CourseCategory.all
    @school = School.find(params[:id])
    @category = CourseCategory.find(params[:category_id])
    @courses = @school.courses
  end

  def show_subject
    @categories = CourseCategory.all
    @subject = Subject.find(params[:id])
    @category = CourseCategory.find(params[:category_id])
    @courses = @subject.courses
  end
end

