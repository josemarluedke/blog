class Post < ActiveRecord::Base
  attr_accessible :content, :slug, :title
  validates :title, :content, :slug, presence: true
  validates :slug, uniqueness: true
end
