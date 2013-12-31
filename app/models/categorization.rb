class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :post

  validates :category, :post, presence: true
end
