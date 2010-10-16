require "spec_helper"

describe Admin::SubjectsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/admin_subjects" }.should route_to(:controller => "admin_subjects", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/admin_subjects/new" }.should route_to(:controller => "admin_subjects", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_subjects/1" }.should route_to(:controller => "admin_subjects", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_subjects/1/edit" }.should route_to(:controller => "admin_subjects", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_subjects" }.should route_to(:controller => "admin_subjects", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin_subjects/1" }.should route_to(:controller => "admin_subjects", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_subjects/1" }.should route_to(:controller => "admin_subjects", :action => "destroy", :id => "1")
    end

  end
end
