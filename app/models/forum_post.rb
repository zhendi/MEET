class ForumPost < ActiveRecord::Base
  belongs_to  :topic
  belongs_to  :user

  after_create :log_activity

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end
end

# == Schema Information
#
# Table name: forum_posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

