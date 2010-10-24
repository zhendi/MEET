require 'spec_helper'

describe "admin_friendships/index.html.erb" do
  before(:each) do
    assign(:admin_friendships, [
      stub_model(Admin::Friendship,
        :user_id => 1,
        :friend_id => 1,
        :status => 1
      ),
      stub_model(Admin::Friendship,
        :user_id => 1,
        :friend_id => 1,
        :status => 1
      )
    ])
  end

  it "renders a list of admin_friendships" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
