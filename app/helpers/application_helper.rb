module ApplicationHelper
  def date_diffs(dt)
    return "#{time_ago_in_words(dt)} ago"
  end
end
