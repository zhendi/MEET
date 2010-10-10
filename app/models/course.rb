class Course < ActiveRecord::Base
  belongs_to	:level
  belongs_to	:course_category
  belongs_to    :subject
  belongs_to    :school
  has_many      :collects
  
  has_many      :collecters,  :through=>:collects, :source=>:user
  belongs_to    :author,  :class_name=>"User"

end



# == Schema Information
#
# Table name: courses
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  description         :text
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  gold                :integer
#  level_id            :integer         not null
#  category_id         :integer         not null
#  author_id           :integer
#  created_at          :datetime
#  updated_at          :datetime
#  subject_id          :integer         default(0), not null
#  school_id           :integer         default(0), not null
#

