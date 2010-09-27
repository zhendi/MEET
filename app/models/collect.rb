class Collect < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :course

end

# == Schema Information
#
# Table name: collects
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  course_id    :integer
#  collected_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

