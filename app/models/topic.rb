class Topic < ActiveRecord::Base
  has_many  :forum_posts, :dependent => :destroy
  belongs_to  :forum
  belongs_to  :user

  acts_as_taggable
end


# == Schema Information
#
# Table name: topics
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  content           :text
#  forum_id          :integer
#  forum_posts_count :integer         default(0)
#  stick             :boolean         default(FALSE)
#  ding              :integer         default(0)
#  cai               :integer         default(0)
#  gold              :integer
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer
#  answers_count     :integer         default(0)
#

