class Feed < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
end

# == Schema Information
#
# Table name: feeds
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

