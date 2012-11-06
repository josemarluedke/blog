require 'machinist/active_record'

User.blueprint do
  name {'Josemar Davi Luedke'}
  email {"josemarluedke#{sn}@gmail.com"}
  password {'josemar'}
  password_confirmation {'josemar'}
end

Post.blueprint do
  title { "Post #{sn}" }
  content  { "Lorem ipsum..." }
  slug { "post-#{sn}" }
  author { User.make! }
  published { true }
end

Category.blueprint do
  name {  "Calegory #{sn}" }
end

Categorization.blueprint do
  category { Category.make }
  post { Post.make! }
end
