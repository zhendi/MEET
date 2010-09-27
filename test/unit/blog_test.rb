require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  summary    :text
#  content    :text
#  ding       :integer         default(0)
#  cai        :integer         default(0)
#  readcount  :integer         default(0)
#  user_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

