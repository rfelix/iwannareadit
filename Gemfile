source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'mysql2'

gem 'omniauth'
gem 'oa-openid', :require => 'omniauth/openid'

gem 'jquery-rails', '>= 0.2.6'

# Google Apps omni-auth gave an error WEBrick::HTTPStatus::RequestURITooLarge
# using Webrick, some say that this doesn't happen with Thin
gem "thin"

group :development do
  gem 'RedCloth', '>= 4.1.1' # To generate rails guides
end

# Used in development in order to be able to run the generators without
# always specifying RAILS_ENV=test
group :test, :development do
  gem "rspec-rails", "~> 2.4"
  gem 'cucumber-rails'
end

group :test, :cucumber do
  gem 'factory_girl'
  gem 'factory_girl_rails'
end

group :cucumber do
  gem 'capybara'
end

group :deployment do
  gem 'heroku'
end
