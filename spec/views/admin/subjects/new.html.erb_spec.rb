require 'spec_helper'

describe "admin_subjects/new.html.erb" do
  before(:each) do
    assign(:subject, stub_model(Admin::Subject,
      :new_record? => true,
      :name => "MyString",
      :parent_id => 1,
      :course_category_id => 1
    ))
  end

  it "renders new subject form" do
    render

    rendered.should have_selector("form", :action => admin_subjects_path, :method => "post") do |form|
      form.should have_selector("input#subject_name", :name => "subject[name]")
      form.should have_selector("input#subject_parent_id", :name => "subject[parent_id]")
      form.should have_selector("input#subject_course_category_id", :name => "subject[course_category_id]")
    end
  end
end
