require 'spec_helper'

describe "courses/index.html.erb" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :name => "Name",
        :description => "MyText",
        :level_id => 1,
        :author_id => 1,
        :subject_id => 1,
        :school_id => 1,
        :course_category_id => 1
      ),
      stub_model(Course,
        :name => "Name",
        :description => "MyText",
        :level_id => 1,
        :author_id => 1,
        :subject_id => 1,
        :school_id => 1,
        :course_category_id => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
