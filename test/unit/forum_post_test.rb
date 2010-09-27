require 'test_helper'

class ForumPostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

