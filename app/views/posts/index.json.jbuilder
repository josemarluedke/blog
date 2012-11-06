json.array!(@posts) do |json, post|
  json.(post, :id, :title, :cover)
  json.introduction truncate(strip_tags(post.content_html), length: 150)
  json.url post_url(post)
  json.created_at l(post.created_at, format: :long)

  json.categories post.categories do |json, category|
    json.(category, :name)
    json.url category_url(category.name)
  end
end
