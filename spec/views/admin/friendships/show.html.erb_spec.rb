require 'spec_helper'

describe "admin_friendships/show.html.erb" do
  before(:each) do
    @friendship = assign(:friendship, stub_model(Admin::Friendship,
      :user_id => 1,
      :friend_id => 1,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
