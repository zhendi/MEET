require 'spec_helper'

describe "admin_schools/new.html.erb" do
  before(:each) do
    assign(:school, stub_model(Admin::School,
      :new_record? => true,
      :name => "MyString",
      :course_category_id => 1
    ))
  end

  it "renders new school form" do
    render

    rendered.should have_selector("form", :action => admin_schools_path, :method => "post") do |form|
      form.should have_selector("input#school_name", :name => "school[name]")
      form.should have_selector("input#school_course_category_id", :name => "school[course_category_id]")
    end
  end
end
