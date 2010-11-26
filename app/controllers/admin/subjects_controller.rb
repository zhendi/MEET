class Admin::SubjectsController < ApplicationController
  # GET /admin/subjects
  # GET /admin/subjects.xml
  def index
    @admin_subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin/subjects/1
  # GET /admin/subjects/1.xml
  def show
    @admin_subject = Subject.find(params[:id])
    @course_category = @admin_subject.course_category
    @courses = Course.where("course_category_id=? and subject_id=?", @course_category.id, @admin_subject.id)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin/subjects/new
  # GET /admin/subjects/new.xml
  def new
    @admin_subject = Subject.new
    @course_category = CourseCategory.find(params[:category_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/subjects/1/edit
  def edit
    @admin_subject = Subject.find(params[:id])
    @course_category = @admin_subject.course_category
  end

  # POST /admin/subjects
  # POST /admin/subjects.xml
  def create
    @admin_subject = Subject.new(params[:subject])
    logger.error("xxxxxxxxxxxxx0000000000000")
    logger.error(@admin_subject)

    respond_to do |format|
      if @admin_subject.save
        format.html { redirect_to([:admin, @admin_subject], :notice => 'Subject was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin/subjects/1
  # PUT /admin/subjects/1.xml
  def update
    @admin_subject = Subject.find(params[:id])

    respond_to do |format|
      if @admin_subject.update_attributes(params[:subject])
        format.html { redirect_to([:admin, @admin_subject], :notice => 'Subject was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin/subjects/1
  # DELETE /admin/subjects/1.xml
  def destroy
    @admin_subject = Subject.find(params[:id])
    @admin_subject.destroy

    respond_to do |format|
      format.html { redirect_to(admin_subjects_url) }
    end
  end
end
