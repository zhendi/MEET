class PeopleController < ApplicationController
  respond_to  :html, :js

  def show
    @user = User.find(params[:id])
    respond_with  @user
  end

  def index
    @users = User.find(:all)

    respond_with(@users)
  end
end
