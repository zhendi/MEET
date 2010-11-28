class Admin::LecturesController < ApplicationController
  respond_to :html,:js

  def index
    @lectureable = find_lectureable
    @lectures = @lectureable.lectures
    @is_admin = true
  end

  def edit
    #@course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
    @course = @lecture.course
  end

  def update
    @lecture = Lecture.find(params[:id]) 
    if @lecture.update_attributes(params[:lecture])
      redirect_to admin_course_path(@lecture.course)
    end
  end

  def create
    @lectureable = find_lectureable
    @lecture = @lectureable.lectures.build(params[:lecture])
    if @lecture.save
      flash[:notice] = "Successfully created lecture."
    else
      render :action => 'new'
    end
  end

  def destroy
    @lectureable = find_lectureable
    @lecture = @lectureable.lectures.find(params[:id])
    @lecture_id = "lecture_#{@lecture.id}"
    if @lecture.destroy
      flash[:notice] = "Successfully deleted"
    end
  end

  private

  def find_lectureable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
