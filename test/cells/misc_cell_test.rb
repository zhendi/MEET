require 'test_helper'

class MiscCellTest < Cell::TestCase
  test "course_category" do
    invoke :course_category
    assert_select "p"
  end
  

end
