class Lecture < ActiveRecord::Base
  #include ActivityLogger

  belongs_to  :course
  belongs_to  :user

  has_many :activities, :foreign_key => "item_id",
    :conditions => "item_type = 'Lecture'",
    :dependent => :destroy
  after_create :log_activity

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end
end



# == Schema Information
#
# Table name: lectures
#
#  id                  :integer         not null, primary key
#  title               :string(255)
#  video_src           :text(255)
#  description         :text
#  course_id           :integer
#  level               :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#

