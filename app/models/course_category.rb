class CourseCategory < ActiveRecord::Base
  has_many  :subjects
  has_many  :schools
  has_many  :courses

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
#  user_id       :integer
#

