require 'spec_helper'

describe "admin_schools/show.html.erb" do
  before(:each) do
    @school = assign(:school, stub_model(Admin::School,
      :name => "Name",
      :course_category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
  end
end
