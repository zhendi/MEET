class PeopleController < ApplicationController
  respond_to  :html, :js

  def show
    @user = User.find(params[:id])
    respond_with  @user
  end

  def index
    @users = User.find(:all)
    @connected_friends = Friendship.where("friend_id=? and status=?", current_user, Friendship::ACCEPTED)
    @requested_friends = Friendship.where("friend_id=? and status=?", current_user, Friendship::REQUESTED)
    @pending_friends = Friendship.where("friend_id=? and status=?", current_user, Friendship::PENDING)
  end
end
