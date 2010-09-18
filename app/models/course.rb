class Course < ActiveRecord::Base
  belongs_to  :teacher
  has_and_belongs_to_many :students
  belongs_to	:level
  belongs_to	:category
end
