class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :posts, through: :categorizations

  attr_accessible :name, :post_ids
  validates :name, presence: true, uniqueness: true
  scope :default_order, -> { order("name ASC") }
end
