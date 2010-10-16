require 'spec_helper'

describe Admin::SchoolsController do

  def mock_school(stubs={})
    @mock_school ||= mock_model(Admin::School, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all admin_schools as @admin_schools" do
      Admin::School.stub(:all) { [mock_school] }
      get :index
      assigns(:admin_schools).should eq([mock_school])
    end
  end

  describe "GET show" do
    it "assigns the requested school as @school" do
      Admin::School.stub(:find).with("37") { mock_school }
      get :show, :id => "37"
      assigns(:school).should be(mock_school)
    end
  end

  describe "GET new" do
    it "assigns a new school as @school" do
      Admin::School.stub(:new) { mock_school }
      get :new
      assigns(:school).should be(mock_school)
    end
  end

  describe "GET edit" do
    it "assigns the requested school as @school" do
      Admin::School.stub(:find).with("37") { mock_school }
      get :edit, :id => "37"
      assigns(:school).should be(mock_school)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created school as @school" do
        Admin::School.stub(:new).with({'these' => 'params'}) { mock_school(:save => true) }
        post :create, :school => {'these' => 'params'}
        assigns(:school).should be(mock_school)
      end

      it "redirects to the created school" do
        Admin::School.stub(:new) { mock_school(:save => true) }
        post :create, :school => {}
        response.should redirect_to(admin_school_url(mock_school))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved school as @school" do
        Admin::School.stub(:new).with({'these' => 'params'}) { mock_school(:save => false) }
        post :create, :school => {'these' => 'params'}
        assigns(:school).should be(mock_school)
      end

      it "re-renders the 'new' template" do
        Admin::School.stub(:new) { mock_school(:save => false) }
        post :create, :school => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested school" do
        Admin::School.should_receive(:find).with("37") { mock_school }
        mock_admin_school.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :school => {'these' => 'params'}
      end

      it "assigns the requested school as @school" do
        Admin::School.stub(:find) { mock_school(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:school).should be(mock_school)
      end

      it "redirects to the school" do
        Admin::School.stub(:find) { mock_school(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_school_url(mock_school))
      end
    end

    describe "with invalid params" do
      it "assigns the school as @school" do
        Admin::School.stub(:find) { mock_school(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:school).should be(mock_school)
      end

      it "re-renders the 'edit' template" do
        Admin::School.stub(:find) { mock_school(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested school" do
      Admin::School.should_receive(:find).with("37") { mock_school }
      mock_admin_school.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_schools list" do
      Admin::School.stub(:find) { mock_school }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_schools_url)
    end
  end

end
