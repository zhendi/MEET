require 'spec_helper'

describe "admin_users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(Admin::User,
      :new_record? => false,
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    rendered.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("input#user_email", :name => "user[email]")
    end
  end
end
