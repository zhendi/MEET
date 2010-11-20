class PeopleCell < Cell::Rails
  helper ApplicationHelper

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

end
