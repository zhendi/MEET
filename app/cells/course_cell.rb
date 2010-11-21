class CourseCell < Cell::Rails

  def courses_category
    @categories = CourseCategory.all

    render
  end
end
