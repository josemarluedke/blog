class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  attr_accessible :content, :slug, :title
  validates :title, :content, :slug, presence: true
  validates :slug, uniqueness: true
end
