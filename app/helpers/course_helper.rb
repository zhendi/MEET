module CourseHelper

  def collected(course)
    begin
      current_user.collected_courses.find(course.id)
    rescue Exception
      return false
    end

    return true
  end
end
