module ActivitiesHelper
  # Given an activity, return a message for the feed for the activity's class.
  def feed_message(activity, recent = false)
    user = activity.user
    case activity_type(activity)
    when "Lecture"
      lecture = activity.item
      if recent
        %(new lecture #{lecture_link(lecture.title)})
      else
        %(#{user_link_with_image(user)} made a lecture
          #{lecture_link(lecture)})
      end
    else
      raise "Invalid activity type #{activity_type(activity).inspect}"
    end
  end

  def minifeed_message(activity)
    user = activity.user
    case activity_type(activity)
    when "Lecture"
      %(#{lecture_link(user)}'s has created a new
        #{lecture_link("lecture", activity.item)}.)
    else
      raise "Invalid activity type #{activity_type(activity).inspect}"
    end
  end

  # Given an activity, return the right icon.
  def feed_icon(activity)
    img = case activity_type(activity)
          when "Blog"
            "page_white.png"
          when "Comment"
            parent_type = activity.item.commentable.class.to_s
            case parent_type
            when "Blog"
              "comment.png"
            end
          when "Friendship"
            if activity.item.contact.admin?
              "vcard.png"
            else
              "connect.png"
            end
          when "ForumPost"
            "asterisk_yellow.png"
          when "Topic"
            "note.png"
          when "User"
            "user_edit.png"
          else
            raise "Invalid activity type #{activity_type(activity).inspect}"
          end
    image_tag("icons/#{img}", :class => "icon")
  end

  def someones(user, commenter, link = true)
    link ? "#{user_link_with_image(user)}'s" : "#{h user.name}'s"
  end

  def lecture_link(text, lecture)
    link_to(text, course_lecture_path(lecture.course, lecture))
  end

  def post_link(text, blog, post = nil)
    if post.nil?
      post = blog
      blog = text
      text = post.title
    end
    link_to(text, blog_post_path(blog, post))
  end

  def topic_link(text, topic = nil)
    if topic.nil?
      topic = text
      text = topic.name
    end
    link_to(text, forum_topic_path(topic.forum, topic))
  end

  def gallery_link(text, gallery = nil)
    if gallery.nil?
      gallery = text
      text = gallery.title
    end
    link_to(h(text), gallery_path(gallery))
  end

  def to_gallery_link(text = nil, gallery = nil)
    if text.nil?
      ''
    else
      'to the ' + gallery_link(text, gallery) + ' gallery'
    end
  end

  def photo_link(text, photo= nil)
    if photo.nil?
      photo = text
      text = "photo"
    end
    link_to(h(text), photo_path(photo))
  end

  def event_link(text, event)
    link_to(text, event_path(event))
  end


  # Return a link to the wall.
  def wall(activity)
    commenter = activity.user
    user = activity.item.commentable
    link_to("#{someones(user, commenter, false)} wall",
            user_path(user, :anchor => "tWall"))
  end

  # Only show member photo for certain types of activity
  def posterPhoto(activity)
    shouldShow = case activity_type(activity)
                 when "Photo"
                   true
                 when "Connection"
                   true
                 else
                   false
                 end
    if shouldShow
      image_link(activity.user, :image => :thumbnail)
    end
  end

  private

  # Return the type of activity.
  # We switch on the class.to_s because the class itself is quite long
  # (due to ActiveRecord).
  def activity_type(activity)
    activity.item.class.to_s      
  end
end

