require 'spec_helper'

describe Admin::SubjectsController do

  def mock_subject(stubs={})
    @mock_subject ||= mock_model(Admin::Subject, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all admin_subjects as @admin_subjects" do
      Admin::Subject.stub(:all) { [mock_subject] }
      get :index
      assigns(:admin_subjects).should eq([mock_subject])
    end
  end

  describe "GET show" do
    it "assigns the requested subject as @subject" do
      Admin::Subject.stub(:find).with("37") { mock_subject }
      get :show, :id => "37"
      assigns(:subject).should be(mock_subject)
    end
  end

  describe "GET new" do
    it "assigns a new subject as @subject" do
      Admin::Subject.stub(:new) { mock_subject }
      get :new
      assigns(:subject).should be(mock_subject)
    end
  end

  describe "GET edit" do
    it "assigns the requested subject as @subject" do
      Admin::Subject.stub(:find).with("37") { mock_subject }
      get :edit, :id => "37"
      assigns(:subject).should be(mock_subject)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created subject as @subject" do
        Admin::Subject.stub(:new).with({'these' => 'params'}) { mock_subject(:save => true) }
        post :create, :subject => {'these' => 'params'}
        assigns(:subject).should be(mock_subject)
      end

      it "redirects to the created subject" do
        Admin::Subject.stub(:new) { mock_subject(:save => true) }
        post :create, :subject => {}
        response.should redirect_to(admin_subject_url(mock_subject))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subject as @subject" do
        Admin::Subject.stub(:new).with({'these' => 'params'}) { mock_subject(:save => false) }
        post :create, :subject => {'these' => 'params'}
        assigns(:subject).should be(mock_subject)
      end

      it "re-renders the 'new' template" do
        Admin::Subject.stub(:new) { mock_subject(:save => false) }
        post :create, :subject => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested subject" do
        Admin::Subject.should_receive(:find).with("37") { mock_subject }
        mock_admin_subject.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :subject => {'these' => 'params'}
      end

      it "assigns the requested subject as @subject" do
        Admin::Subject.stub(:find) { mock_subject(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:subject).should be(mock_subject)
      end

      it "redirects to the subject" do
        Admin::Subject.stub(:find) { mock_subject(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_subject_url(mock_subject))
      end
    end

    describe "with invalid params" do
      it "assigns the subject as @subject" do
        Admin::Subject.stub(:find) { mock_subject(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:subject).should be(mock_subject)
      end

      it "re-renders the 'edit' template" do
        Admin::Subject.stub(:find) { mock_subject(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested subject" do
      Admin::Subject.should_receive(:find).with("37") { mock_subject }
      mock_admin_subject.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_subjects list" do
      Admin::Subject.stub(:find) { mock_subject }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_subjects_url)
    end
  end

end
