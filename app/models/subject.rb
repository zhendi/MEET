class Subject < ActiveRecord::Base
  acts_as_tree :order => "name"
  has_many  :courses
  belongs_to  :course_category

end
