class CoursesController < ApplicationController
  layout  "course"
  filter_resource_access
  respond_to :html,:js

  before_filter :select_categories

  def index
  end

  def new
    @course = Course.new()
    @course_category = CourseCategory.find(params[:course_category_id])

    if params[:school_id]
      @school = School.find(params[:school_id])
      @subject = Subject.where("name=?", "Uncategoried").first
    end

    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
      @school = School.where("name=?", "Uncategoried").first
    end

    @subjects = @course_category.subjects
    @schools = @course_category.schools

    respond_with(@course)
  end

  def show
    @course = Course.find(params[:id])

    respond_with(@course)
  end

  def create
    @course = Course.new(params[:course])
    @course.author = current_user

    if @course.save
      redirect_to study_course_course_path(@course), :notice=>"Create Succeed"
    else
      render	:action=>:new, :notice=>"Create Failed"
    end
  end

  def edit
    @course = Course.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])

    @school = School.find(params[:school_id])
    @subject = Subject.find(params[:subject_id])

    @subjects = @course_category.subjects
    @schools = @course_category.schools

    respond_with(@course)	
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to study_course_course_path(@course), :notice=>"Update Succeed"
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
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools
  end

  # 显示学校信息
  def show_school
    @school = School.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])
    @courses = @school.courses

    @subjects = []
    @courses.each do |c|
      @subjects << c.subject
    end
  end

  def show_subject
    @subject = Subject.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])
    @courses = @subject.courses

    @schools = []
    @courses.each do |c|
      @schools << c.school
    end
  end


  def study_course
    @course = Course.find(params[:id])

    @course_category = @course.course_category
    @school = @course.school
    @subject = @course.subject
  end

  protected
  def select_categories
    @categories = CourseCategory.all
  end
end

