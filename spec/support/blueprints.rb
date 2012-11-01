require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.

User.blueprint do
  name {'Josemar Davi Luedke'}
  email {'josemarluedke@gmail.com'}
  password {'josemar'}
  password_confirmation {'josemar'}
end

Post.blueprint do
  title { "Post #{sn}" }
  content  { "Lorem ipsum..." }
  slug { "post-#{sn}" }
end
