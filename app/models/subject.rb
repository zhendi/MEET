class Subject < ActiveRecord::Base
  acts_as_tree :order => "name"
  has_many  :courses
  belongs_to  :course_category

  def roots
    Subject.find(["parent_id=?"], 0)
  end
end


# == Schema Information
#
# Table name: subjects
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  parent_id          :integer
#  course_category_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#

