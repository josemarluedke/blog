require 'spec_helper'

describe Post do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :slug }
    it { should validate_presence_of :author }
    pending { Post.make!; should validate_uniqueness_of :slug }
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

    it "should have the right content_html" do
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
  end
end
