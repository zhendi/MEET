class CourseController < ApplicationController
  respond_to :html, :js

  def index
    @courses = Course.select(:all)

    
  end
end
