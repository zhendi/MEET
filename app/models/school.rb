class School < ActiveRecord::Base
  has_many  :courses
  belongs_to  :course_category

end
