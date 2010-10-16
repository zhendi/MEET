require "spec_helper"

describe Admin::SchoolsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/admin_schools" }.should route_to(:controller => "admin_schools", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/admin_schools/new" }.should route_to(:controller => "admin_schools", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_schools/1" }.should route_to(:controller => "admin_schools", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_schools/1/edit" }.should route_to(:controller => "admin_schools", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_schools" }.should route_to(:controller => "admin_schools", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin_schools/1" }.should route_to(:controller => "admin_schools", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_schools/1" }.should route_to(:controller => "admin_schools", :action => "destroy", :id => "1")
    end

  end
end
