class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :author, class_name: "User", foreign_key: :user_id
  
  has_many :categorizations, inverse_of: :post
  has_many :categories, through: :categorizations
  
  validates :title, :content, :slug, :author, presence: true
  validates :slug, uniqueness: true

  scope :category, lambda { |name|
    category = Category.where("name ILIKE ?", name).first
    return [] if category.nil?
    category.posts.public
  }

  scope :public, -> { where(published: true) }

  auto_html_for :content do
    redcarpet renderer: HtmlCoderay, markdown_options: { fenced_code_blocks: true }
  end

  def cover
    content_html.split(/<img\s+src="(.+?)".+?>/)[1]
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
