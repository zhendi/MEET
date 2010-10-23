require 'spec_helper'

describe "courses/new.html.erb" do
  before(:each) do
    assign(:course, stub_model(Course,
      :new_record? => true,
      :name => "MyString",
      :description => "MyText",
      :level_id => 1,
      :author_id => 1,
      :subject_id => 1,
      :school_id => 1,
      :course_category_id => 1
    ))
  end

  it "renders new course form" do
    render

    rendered.should have_selector("form", :action => courses_path, :method => "post") do |form|
      form.should have_selector("input#course_name", :name => "course[name]")
      form.should have_selector("textarea#course_description", :name => "course[description]")
      form.should have_selector("input#course_level_id", :name => "course[level_id]")
      form.should have_selector("input#course_author_id", :name => "course[author_id]")
      form.should have_selector("input#course_subject_id", :name => "course[subject_id]")
      form.should have_selector("input#course_school_id", :name => "course[school_id]")
      form.should have_selector("input#course_course_category_id", :name => "course[course_category_id]")
    end
  end
end
