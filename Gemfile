source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'bootstrap-sass'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
gem 'rainbows'
gem 'eventmachine-le'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'sinatra'
gem 'sinatra-contrib'

# see https://github.com/raggi/async_sinatra/issues/30
# freeze once this has been released in the official gem
#gem 'async_sinatra', git: 'git://github.com/soffes/async_sinatra.git', ref: 'f00c791c8baa150bea4de7a4efbe941b93470c02'
gem 'async_sinatra', path: '../async_sinatra'

gem 'mongoid'

group :development, :test do
	gem 'rspec-rails'
	gem 'rspec'
	gem 'thin'
	gem 'sextant'
end