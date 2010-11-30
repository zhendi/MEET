require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: forums
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :string(255)
#  priority     :integer         default(0)
#  topics_count :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

