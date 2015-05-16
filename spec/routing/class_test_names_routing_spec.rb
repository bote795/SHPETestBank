require "spec_helper"

describe ClassTestNamesController do
  describe "routing" do

    it "routes to #index" do
      get("/class_test_names").should route_to("class_test_names#index")
    end

    it "routes to #new" do
      get("/class_test_names/new").should route_to("class_test_names#new")
    end

    it "routes to #show" do
      get("/class_test_names/1").should route_to("class_test_names#show", :id => "1")
    end

    it "routes to #edit" do
      get("/class_test_names/1/edit").should route_to("class_test_names#edit", :id => "1")
    end

    it "routes to #create" do
      post("/class_test_names").should route_to("class_test_names#create")
    end

    it "routes to #update" do
      put("/class_test_names/1").should route_to("class_test_names#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/class_test_names/1").should route_to("class_test_names#destroy", :id => "1")
    end

  end
end
