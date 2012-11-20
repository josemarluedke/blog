class HTMLwithCodeRay < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:css => :class)
  end
end


class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :categorizations
  has_many :categories, through: :categorizations
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :content, :slug, :title, :category_ids, :user_id, :published
  validates :title, :content, :slug, :author, presence: true
  validates :slug, uniqueness: true

  scope :category, lambda { |name|
    category = Category.where("name ILIKE ?", name).first
    return [] if category.nil?
    category.posts.public
  }

  scope :public, -> { where(published: true) }

  auto_html_for :content do
    redcarpet renderer: HTMLwithCodeRay, markdown_options: { fenced_code_blocks: true }
  end

  def cover
    content_html.split(/<img\s+src="(.+?)".+?>/)[1]
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
