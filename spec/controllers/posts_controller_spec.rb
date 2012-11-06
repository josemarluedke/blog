require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.make!
      get :index
      assigns(:posts).should eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.make!
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET index with category" do

  end
end
