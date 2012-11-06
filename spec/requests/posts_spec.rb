require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "should get the posts" do
      get posts_path
      response.status.should be(200)
    end
  end

  describe "GET /:category" do
    it "should raise 404 when has no post in the category" do
      lambda { get "/Lorem" }.should raise_error(ActionController::RoutingError)
    end
  end
end
