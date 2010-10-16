require 'spec_helper'

describe "admin_users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(Admin::User,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Email".to_s)
  end
end
