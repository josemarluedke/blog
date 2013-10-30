class PostsController < InheritedResources::Base
  actions :index, :show
  respond_to :html
  respond_to :rss, only: [:index]
  has_scope :category

  protected
  def collection
    return render_404 if params[:category].present? and not Post.category(params[:category]).any?
    @posts ||= end_of_association_chain.order("created_at DESC").public
  end
end
