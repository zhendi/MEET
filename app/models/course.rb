class Course < ActiveRecord::Base
  belongs_to	:level
  belongs_to	:category
  has_many      :collects
  has_many      :collecters,  :through=>:collects, :source=>:user
  belongs_to    :author,  :class_name=>"User"

end
