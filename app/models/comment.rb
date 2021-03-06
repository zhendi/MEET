class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  belongs_to  :user

  after_create :log_activity

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end
end



# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  email            :string(255)
#  title            :string(255)
#  memo             :text
#  blog_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#

