require 'spec_helper'

describe "admin_roles/index.html.erb" do
  before(:each) do
    assign(:admin_roles, [
      stub_model(Admin::Role,
        :name => "Name"
      ),
      stub_model(Admin::Role,
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin_roles" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
