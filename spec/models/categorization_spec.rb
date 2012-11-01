require 'spec_helper'

describe Categorization do
  subject { Categorization.make! }
  describe "Validations" do
    it { should validate_presence_of :category }
    it { should validate_presence_of :post }
  end

  describe "Associations" do
    it { should belong_to :category }
    it { should belong_to :post }
  end
end
