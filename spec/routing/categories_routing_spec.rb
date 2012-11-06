require "spec_helper"

describe "Category Routes" do
  describe "routing" do

    it "routes to category filter" do
      get("/Ruby").should route_to("posts#index", category: "Ruby")
    end

  end
end
