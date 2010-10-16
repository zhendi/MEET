require 'spec_helper'

describe "admin_schools/edit.html.erb" do
  before(:each) do
    @school = assign(:school, stub_model(Admin::School,
      :new_record? => false,
      :name => "MyString",
      :course_category_id => 1
    ))
  end

  it "renders the edit school form" do
    render

    rendered.should have_selector("form", :action => school_path(@school), :method => "post") do |form|
      form.should have_selector("input#school_name", :name => "school[name]")
      form.should have_selector("input#school_course_category_id", :name => "school[course_category_id]")
    end
  end
end
