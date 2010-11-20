require 'test_helper'

class PeopleCellTest < Cell::TestCase
  test "message_board" do
    invoke :message_board
    assert_select "p"
  end
  
  test "network_activity" do
    invoke :network_activity
    assert_select "p"
  end
  
  test "other_people" do
    invoke :other_people
    assert_select "p"
  end
  

end
