source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Database
gem 'pg'
gem "foreigner"

# Improvements
gem 'inherited_resources'
#gem 'has_scope'

# Authentication
#gem "devise", "~> 2.1.2"
#gem "omniauth", "~> 1.1.0"
#gem "omniauth-facebook", "~> 1.2.0"
#gem "omniauth-twitter", "~> 0.0.12"

# Heroku - Server
gem 'thin'
gem 'heroku'

# Frontend stuff
gem 'jquery-rails'
gem "slim"
gem "slim-rails"
gem 'initjs'
gem 'rack-google-analytics'

# Tools
#gem 'simple_form'
#gem 'auto_html'

# Administration
#gem 'activeadmin'

group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem "compass-rails", "~> 1.0.3"
  #gem 'bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'
  #gem 'turbolinks'
end

group :production do
  gem "execjs"
  gem 'therubyracer', :platform => :ruby
end

group :development, :test do
  gem "rspec-rails", ">= 2.11.0"
  gem "shoulda-matchers"
  gem "machinist", ">= 2.0"
  gem "ffaker"
  gem 'database_cleaner'
  gem "capybara"
  gem "jasmine"
  gem "pry"
  gem 'awesome_print'
end
