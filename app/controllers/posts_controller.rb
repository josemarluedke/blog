class PostsController < InheritedResources::Base
  actions :index, :show
  respond_to :html, :json
  has_scope :category

  def collection
    @posts ||= end_of_association_chain.public
  end
end
