require 'spec_helper'

describe "admin_subjects/index.html.erb" do
  before(:each) do
    assign(:admin_subjects, [
      stub_model(Admin::Subject,
        :name => "Name",
        :parent_id => 1,
        :course_category_id => 1
      ),
      stub_model(Admin::Subject,
        :name => "Name",
        :parent_id => 1,
        :course_category_id => 1
      )
    ])
  end

  it "renders a list of admin_subjects" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
