class FriendshipsController < ApplicationController
  before_filter :authorize_user, :only => [:edit, :update, :destroy]

  def create 
    friend = User.find(params[:friend_id])
    if Friendship.request(current_user, friend) 
      flash[:notice] = "Added friend." 
    else      
      flash[:notice] = "Unable to add friend."      
    end      

    redirect_to people_path
  end      

  def destroy      
    @friendship.breakup

    flash[:notice] = "Removed friendship."      
    redirect_to people_path
  end  

  def update
    contact = @friendship.friend
    name = user_name(contact)
    case params[:commit]
    when "Accept"
      logger.info("------------------------------Accept")
      @friendship.accept
      flash[:notice] = %(Accepted connection with
                           <a href="#{person_url(contact)}">#{name}</a>)
    when "Decline"
      logger.info("-------------------------------Decline")
      @friendship.breakup
      flash[:notice] = "Declined connection with #{name}"
    end

    redirect_to people_path
  end 

  private
  # Make sure the current person is correct for this connection.
  def authorize_user
    @friendship = Friendship.find(params[:id], :include => [:user])
    unless current_user == @friendship.friend
      flash[:error] = "Invalid connection."
      redirect_to people_path
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid or expired connection request"
    redirect_to people_path
  end
end
