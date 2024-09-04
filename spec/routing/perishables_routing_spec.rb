require "rails_helper"

RSpec.describe PerishablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/perishables").to route_to("perishables#index")
    end

    it "routes to #new" do
      expect(get: "/perishables/new").to route_to("perishables#new")
    end

    it "routes to #show" do
      expect(get: "/perishables/1").to route_to("perishables#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/perishables/1/edit").to route_to("perishables#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/perishables").to route_to("perishables#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/perishables/1").to route_to("perishables#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/perishables/1").to route_to("perishables#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/perishables/1").to route_to("perishables#destroy", id: "1")
    end
  end
end
