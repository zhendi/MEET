require "spec_helper"

describe Admin::FriendshipsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/admin_friendships" }.should route_to(:controller => "admin_friendships", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/admin_friendships/new" }.should route_to(:controller => "admin_friendships", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_friendships/1" }.should route_to(:controller => "admin_friendships", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_friendships/1/edit" }.should route_to(:controller => "admin_friendships", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_friendships" }.should route_to(:controller => "admin_friendships", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin_friendships/1" }.should route_to(:controller => "admin_friendships", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_friendships/1" }.should route_to(:controller => "admin_friendships", :action => "destroy", :id => "1")
    end

  end
end
