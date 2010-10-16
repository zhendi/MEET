require 'spec_helper'

describe "admin_subjects/show.html.erb" do
  before(:each) do
    @subject = assign(:subject, stub_model(Admin::Subject,
      :name => "Name",
      :parent_id => 1,
      :course_category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
