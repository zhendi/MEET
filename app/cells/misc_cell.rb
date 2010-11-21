class MiscCell < Cell::Rails

  def courses_category
    @categories = CourseCategory.all

    render
  end

end
