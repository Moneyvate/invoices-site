require "spec_helper"

describe ClientTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/client_types").should route_to("client_types#index")
    end

    it "routes to #new" do
      get("/client_types/new").should route_to("client_types#new")
    end

    it "routes to #show" do
      get("/client_types/1").should route_to("client_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/client_types/1/edit").should route_to("client_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/client_types").should route_to("client_types#create")
    end

    it "routes to #update" do
      put("/client_types/1").should route_to("client_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/client_types/1").should route_to("client_types#destroy", :id => "1")
    end

  end
end
