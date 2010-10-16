require 'spec_helper'

describe "admin_users/index.html.erb" do
  before(:each) do
    assign(:admin_users, [
      stub_model(Admin::User,
        :email => "Email"
      ),
      stub_model(Admin::User,
        :email => "Email"
      )
    ])
  end

  it "renders a list of admin_users" do
    render
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
  end
end
