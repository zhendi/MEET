module ForumsHelper
  def last_topic_name(forum)
    if forum.topics.last != nil
      return forum.topics.last.name
    else
      return ""
    end
  end
end
