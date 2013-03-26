# Blog

Personal blog made with Slim, Saas, Compass & Bootstrap on top of Ruby on Rails 


## Development environment

You'll need [RVM](https://rvm.io/) to isolate your development environment.

Make sure you install `Ruby 1.9.3` on your [RVM](https://rvm.io/).

Then just checkout the code, configure dependencies and run the tests:

1. Clone the repository:

 `git clone git://github.com/josemarluedke/blog.git`

2. Enter the repo directory and accept the [RVM](https://rvm.io/):

 `cd blog`

 `yes` if solicited

3. Install [Bundler](http://gembundler.com/) into our [RVM](https://rvm.io/):

 `gem install bundler`

4. Install all dependencies from [Gemspec](http://docs.rubygems.org/read/chapter/20):

 `bundler install`

### Running tests

1. Go to app folder

	`cd blog`

2. Prepare the database
	
	`bundle exec rake db:test:prepare`

3. Run the rspec

	`rspec spec/`


## Work left to do

* Add proper requests specs


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
