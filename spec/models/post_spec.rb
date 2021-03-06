require 'spec_helper'

describe Post do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :slug }
    it { should validate_presence_of :author }
  end

  describe "Associations" do
    it { should belong_to :author }
    it { should have_many :categorizations }
    it { should have_many :categories }
  end

  describe "auto_html ()" do
    let(:post) { Post.make! content: "A _simple_ content of *post* [Link](http://example.com)", slug: "tst" }

    it "should have the right content" do
      post.content.should == "A _simple_ content of *post* [Link](http://example.com)"
    end

    it "should convert the markdown to html" do
      post.content_html.should == "<p>A <em>simple</em> content of <em>post</em> <a href=\"http://example.com\">Link</a></p>\n"
    end
  end

  describe "scopes" do
    describe "category" do
      before do
        @category = Category.make! name: "Ruby"
        @post_1 = Post.make!
        @post_2 = Post.make!
        Post.make!

        Categorization.make! category: @category, post: @post_1
        Categorization.make! category: @category, post: @post_2
      end
      subject { Post.category(@category.name) }

      it { should have(2).items }
      it { should == [@post_1, @post_2] }
    end

    describe "public" do
      before do
        @post_1 = Post.make!
        @post_2 = Post.make!
        Post.make! published: false
      end
      subject { Post.public }

      it { should have(2).items }
      it { should == [@post_1, @post_2] }
    end
  end

  describe "#cover" do
    let(:post) { Post.make! content: "A _simple_ content of *post* ![](http://example.com/image.jpg) Some more text here. Other image here: ![](http://example.com/image_2.jpg)" }

    it "should convert the markdown to html" do
      post.content_html.should == "<p>A <em>simple</em> content of <em>post</em> <img src=\"http://example.com/image.jpg\" alt=\"\"> Some more text here. Other image here: <img src=\"http://example.com/image_2.jpg\" alt=\"\"></p>\n"
    end

    it "should return the first image that is found" do
      post.cover.should == "http://example.com/image.jpg"
    end

    it "should return nil when is no image" do
      post = Post.make! content: "Some great blog post"
      post.cover.should be_nil
    end
  end
end
