class School < ActiveRecord::Base
  has_many  :courses
  belongs_to  :course_category

end

# == Schema Information
#
# Table name: schools
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  course_category_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

