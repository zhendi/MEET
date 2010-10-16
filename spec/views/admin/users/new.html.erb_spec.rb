require 'spec_helper'

describe "admin_users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(Admin::User,
      :new_record? => true,
      :email => "MyString"
    ))
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => admin_users_path, :method => "post") do |form|
      form.should have_selector("input#user_email", :name => "user[email]")
    end
  end
end
