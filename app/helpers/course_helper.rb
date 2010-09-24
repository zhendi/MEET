module CourseHelper
  def collected(course)
    res = current_user.collected_courses.where(course.id)
    return res
  end
end
