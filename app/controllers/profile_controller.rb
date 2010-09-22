class ProfileController < ApplicationController
  respond_to :html

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
      redirect_to profile_path(@profile)
    end
  end
end
