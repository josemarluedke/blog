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
    before do
      @category = Category.make! name: "Ruby"
      @post_1 = Post.make!
      @post_2 = Post.make!
      Post.make!

      Categorization.make! category: @category, post: @post_1
      Categorization.make! category: @category, post: @post_2
    end

    it "assigns the requested category as @posts" do
      get :index, { category: @category.name }
      assigns(:posts).should have(2).items
      assigns(:posts).should == [@post_1, @post_2]
    end
  end
end
