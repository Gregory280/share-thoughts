require "rails_helper"

RSpec.describe TestesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/testes").to route_to("testes#index")
    end

    it "routes to #new" do
      expect(get: "/testes/new").to route_to("testes#new")
    end

    it "routes to #show" do
      expect(get: "/testes/1").to route_to("testes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/testes/1/edit").to route_to("testes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/testes").to route_to("testes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/testes/1").to route_to("testes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/testes/1").to route_to("testes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/testes/1").to route_to("testes#destroy", id: "1")
    end
  end
end
