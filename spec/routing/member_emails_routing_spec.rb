require "spec_helper"

describe MemberEmailsController do
  describe "routing" do

    it "routes to #index" do
      get("/member_emails").should route_to("member_emails#index")
    end

    it "routes to #new" do
      get("/member_emails/new").should route_to("member_emails#new")
    end

    it "routes to #show" do
      get("/member_emails/1").should route_to("member_emails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/member_emails/1/edit").should route_to("member_emails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/member_emails").should route_to("member_emails#create")
    end

    it "routes to #update" do
      put("/member_emails/1").should route_to("member_emails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/member_emails/1").should route_to("member_emails#destroy", :id => "1")
    end

  end
end
