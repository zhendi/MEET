class PeopleController < ApplicationController
  respond_to  :html, :js

  def index
    logger.info("--------------------------index")
  end

  def people
    logger.info("---------------------------people")
    @user = User.find(params[:id])

    respond_with(@user)
  end

  def allusers
    @users = User.find(:all)

    respond_with(@users)
  end
end
