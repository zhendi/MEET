require 'spec_helper'

describe "admin_schools/index.html.erb" do
  before(:each) do
    assign(:admin_schools, [
      stub_model(Admin::School,
        :name => "Name",
        :course_category_id => 1
      ),
      stub_model(Admin::School,
        :name => "Name",
        :course_category_id => 1
      )
    ])
  end

  it "renders a list of admin_schools" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
