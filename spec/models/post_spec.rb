require 'spec_helper'

describe Post do
  subject { Post.make! }
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :slug }
    it { should validate_uniqueness_of :slug }
  end

  describe "Associations" do
    it { should belong_to :author }
  end
end
