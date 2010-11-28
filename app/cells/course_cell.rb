class CourseCell < Cell::Rails

  def courses_category
    @categories = CourseCategory.all

    render
  end

  def subject_courses
    @subjects = @opts[:subjects]

    render
  end
  
  def show_lectures
    @lectures = @opts[:lectures]
    @is_admin = @opts[:is_admin]

    render
  end
end
