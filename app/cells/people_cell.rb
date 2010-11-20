class PeopleCell < Cell::Rails
  helper  ApplicationHelper

  def message_board
    render
  end

  def network_activity
    render
  end

  def other_people
    render
  end

  def personal_setting
    render
  end

  def current_people
    render
  end

  def personal_info
    @user = User.find(params[:id])

    render
  end

  def all_people
    @users = User.find(:all)

    render
  end

  def connected_friends
    current_user = @opts[:current_user]
    @connected_friends = Friendship.where("user_id=? and status=?", current_user, Friendship::ACCEPTED)

    render
  end

  def requested_friends
    current_user = @opts[:current_user]
    @requested_friends = Friendship.where("friend_id=? and status=?", current_user, Friendship::REQUESTED)
    
    render
  end

  def pending_friends
    current_user = @opts[:current_user]
    @pending_friends = Friendship.where("user_id=? and status=?", current_user, Friendship::PENDING)

    render
  end
end
