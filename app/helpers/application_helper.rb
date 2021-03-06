# coding: utf-8

module ApplicationHelper
  def sex_display(sex)
    if sex 
      return "男"
    else
      return "女"
    end
  end

  def user_name(user)
    if user.profile.name.presence 
      return user.profile.name
    end  

    return user.email
  end

  def user_pic(user)
    if user == nil
      return "male.gif"
    elsif user.profile.avatar_file_name.presence
      return current_user.profile.avatar.url
    end

    return "male.gif"
  end

  def current_user?(user)
    if current_user == user
      return true
    else
      return false
    end
  end
end
