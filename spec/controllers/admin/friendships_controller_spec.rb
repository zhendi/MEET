require 'spec_helper'

describe Admin::FriendshipsController do

  def mock_friendship(stubs={})
    @mock_friendship ||= mock_model(Admin::Friendship, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all admin_friendships as @admin_friendships" do
      Admin::Friendship.stub(:all) { [mock_friendship] }
      get :index
      assigns(:admin_friendships).should eq([mock_friendship])
    end
  end

  describe "GET show" do
    it "assigns the requested friendship as @friendship" do
      Admin::Friendship.stub(:find).with("37") { mock_friendship }
      get :show, :id => "37"
      assigns(:friendship).should be(mock_friendship)
    end
  end

  describe "GET new" do
    it "assigns a new friendship as @friendship" do
      Admin::Friendship.stub(:new) { mock_friendship }
      get :new
      assigns(:friendship).should be(mock_friendship)
    end
  end

  describe "GET edit" do
    it "assigns the requested friendship as @friendship" do
      Admin::Friendship.stub(:find).with("37") { mock_friendship }
      get :edit, :id => "37"
      assigns(:friendship).should be(mock_friendship)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created friendship as @friendship" do
        Admin::Friendship.stub(:new).with({'these' => 'params'}) { mock_friendship(:save => true) }
        post :create, :friendship => {'these' => 'params'}
        assigns(:friendship).should be(mock_friendship)
      end

      it "redirects to the created friendship" do
        Admin::Friendship.stub(:new) { mock_friendship(:save => true) }
        post :create, :friendship => {}
        response.should redirect_to(admin_friendship_url(mock_friendship))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved friendship as @friendship" do
        Admin::Friendship.stub(:new).with({'these' => 'params'}) { mock_friendship(:save => false) }
        post :create, :friendship => {'these' => 'params'}
        assigns(:friendship).should be(mock_friendship)
      end

      it "re-renders the 'new' template" do
        Admin::Friendship.stub(:new) { mock_friendship(:save => false) }
        post :create, :friendship => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested friendship" do
        Admin::Friendship.should_receive(:find).with("37") { mock_friendship }
        mock_admin_friendship.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :friendship => {'these' => 'params'}
      end

      it "assigns the requested friendship as @friendship" do
        Admin::Friendship.stub(:find) { mock_friendship(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:friendship).should be(mock_friendship)
      end

      it "redirects to the friendship" do
        Admin::Friendship.stub(:find) { mock_friendship(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_friendship_url(mock_friendship))
      end
    end

    describe "with invalid params" do
      it "assigns the friendship as @friendship" do
        Admin::Friendship.stub(:find) { mock_friendship(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:friendship).should be(mock_friendship)
      end

      it "re-renders the 'edit' template" do
        Admin::Friendship.stub(:find) { mock_friendship(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested friendship" do
      Admin::Friendship.should_receive(:find).with("37") { mock_friendship }
      mock_admin_friendship.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_friendships list" do
      Admin::Friendship.stub(:find) { mock_friendship }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_friendships_url)
    end
  end

end
