class ProfileController < ApplicationController
  respond_to :html

  def index
    @blogs = Blog.paginate :page => params[:page], :order => 'created_at DESC' 
  end

  def show
    @profile = current_user.profile
    @user = current_user

    if @profile == nil
      @profile = Profile.new()
      @profile.user = @user
      @profile.save()
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      render  :action=>"show"
    else
      render  :action=>"show", :error=>"save failed"
    end
  end
end
