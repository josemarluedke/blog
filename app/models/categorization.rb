class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :post

  attr_accessible :category_id, :post_id
  validates :category, :post, presence: true
end
