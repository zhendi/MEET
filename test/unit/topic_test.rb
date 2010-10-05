require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

