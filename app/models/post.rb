class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :categorizations
  has_many :categories, through: :categorizations

  attr_accessible :content, :slug, :title, :category_ids, :user_id
  validates :title, :content, :slug, :author, presence: true
  validates :slug, uniqueness: true
end
