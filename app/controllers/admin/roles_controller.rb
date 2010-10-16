class Admin::RolesController < ApplicationController
  # GET /admin/roles
  # GET /admin/roles.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin/roles/1
  # GET /admin/roles/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin/roles/new
  # GET /admin/roles/new.xml
  def new
    @role = Admin::Role.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /admin/roles
  # POST /admin/roles.xml
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to([:admin, @role], :notice => 'Role was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin/roles/1
  # PUT /admin/roles/1.xml
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @admin_role.update_attributes(params[:role])
        format.html { redirect_to([:admin, @role], :notice => 'Role was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin/roles/1
  # DELETE /admin/roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(admin_roles_url) }
    end
  end
end
