require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  name {'Josemar Davi Luedke'}
  email {'josemarluedke@gmail.com'}
  password {'josemar'}
  password_confirmation {'josemar'}
end
