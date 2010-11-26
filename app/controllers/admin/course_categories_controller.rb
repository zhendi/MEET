class Admin::CourseCategoriesController < ApplicationController
  respond_to  :html

  def index
    @course_categories = CourseCategory.all
  end

  def show
    @course_category = CourseCategory.find(params[:id])
    @subjects = Subject.where("course_category_id=? and parent_id is null", @course_category.id)
  end

  def new
    @course_category = CourseCategory.new()
  end

  def edit
    @course_category = CourseCategory.find(params[:id])
  end

  def update
    @course_category = CourseCategory.find(params[:id])
    if @course_category.update_attributes(params[:course_category])
      redirect_to admin_course_categories_path, :notice=>"Update succeed"
    else
      render  :action=>:edit, :notice=>"Update Failed"
    end 
  end

  def create
    @course_category = CourseCategory.new(params[:course_category])
    if @course_category.save
      redirect_to admin_course_categories_path, :notice=>"Create succeed"
    else
      render  new_admin_course_categories_path, :error=>"Create failed"
    end
  end

  def destroy
    @course_category = CourseCategory.find(params[:id])
    @course_category.destroy
   
    redirect_to admin_course_categories_path, :notice=>"delete succeed"
  end
end
