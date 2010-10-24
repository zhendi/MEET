require 'spec_helper'

describe "admin_friendships/edit.html.erb" do
  before(:each) do
    @friendship = assign(:friendship, stub_model(Admin::Friendship,
      :new_record? => false,
      :user_id => 1,
      :friend_id => 1,
      :status => 1
    ))
  end

  it "renders the edit friendship form" do
    render

    rendered.should have_selector("form", :action => friendship_path(@friendship), :method => "post") do |form|
      form.should have_selector("input#friendship_user_id", :name => "friendship[user_id]")
      form.should have_selector("input#friendship_friend_id", :name => "friendship[friend_id]")
      form.should have_selector("input#friendship_status", :name => "friendship[status]")
    end
  end
end
