class Admin::CoursesController < ApplicationController
    respond_to  :html,:js

    def index
        @courses = Course.find(:all)
        @categories = CourseCategory.find(:all)
    end

    def new
        @course_category = CourseCategory.find(params[:category_id])
        @subject = Subject.find(params[:subject_id])

        @course = Course.new()
    end

    def show
        @course = Course.find(params[:id])
    end

    def edit
        @course = Course.find(params[:id])
        @course_category = @course.course_category
        @subject = @course.subject
    end

    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(params[:course])
            redirect_to [:admin, @course], :notice=>"Update Succeed"
        else
            render	:action=>:edit, :notice=>"Update Failed"
        end
    end

    def create
        @course = Course.new(params[:course])
        if @course.save()
            redirect_to [:admin, @course], :notice=>"Update Succeed"
        else
            render	:action=>:edit, :notice=>"Update Failed"
        end
    end

    def destroy
        @course = Course.find(params[:id])
        if @course.destroy
            redirect_to admin_courses_path, :notice=>"destroy succeed"
        end
    end
end

