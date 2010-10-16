class Admin::SchoolsController < ApplicationController
  # GET /admin/schools
  # GET /admin/schools.xml
  def index
    @admin_schools = School.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin/schools/1
  # GET /admin/schools/1.xml
  def show
    @admin_school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin/schools/new
  # GET /admin/schools/new.xml
  def new
    @admin_school = School.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/schools/1/edit
  def edit
    @admin_school = School.find(params[:id])
  end

  # POST /admin/schools
  # POST /admin/schools.xml
  def create
    @admin_school = School.new(params[:school])

    respond_to do |format|
      if @admin_school.save
        format.html { redirect_to([:admin, @admin_school], :notice => 'School was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin/schools/1
  # PUT /admin/schools/1.xml
  def update
    @admin_school = School.find(params[:id])

    respond_to do |format|
      if @admin_school.update_attributes(params[:school])
        format.html { redirect_to([:admin, @admin_school], :notice => 'School was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin/schools/1
  # DELETE /admin/schools/1.xml
  def destroy
    @admin_school = School.find(params[:id])
    @admin_school.destroy

    respond_to do |format|
      format.html { redirect_to(admin_schools_url) }
    end
  end
end
