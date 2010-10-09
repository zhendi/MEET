class CourseCategory < ActiveRecord::Base
  has_many  :subjects
  has_many  :schools

end

# == Schema Information
#
# Table name: course_categories
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  courses_count :integer
#  created_at    :datetime
#  updated_at    :datetime
#

