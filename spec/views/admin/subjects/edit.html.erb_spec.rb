require 'spec_helper'

describe "admin_subjects/edit.html.erb" do
  before(:each) do
    @subject = assign(:subject, stub_model(Admin::Subject,
      :new_record? => false,
      :name => "MyString",
      :parent_id => 1,
      :course_category_id => 1
    ))
  end

  it "renders the edit subject form" do
    render

    rendered.should have_selector("form", :action => subject_path(@subject), :method => "post") do |form|
      form.should have_selector("input#subject_name", :name => "subject[name]")
      form.should have_selector("input#subject_parent_id", :name => "subject[parent_id]")
      form.should have_selector("input#subject_course_category_id", :name => "subject[course_category_id]")
    end
  end
end
