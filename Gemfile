source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'sqlite3-ruby', :require => 'sqlite3'

group :development do
  gem 'RedCloth', '>= 4.1.1' # To generate rails guides
end

# Used in development in order to be able to run the generators without
# always specifying RAILS_ENV=test
group :test, :development do
  gem "rspec-rails", "~> 2.4"
  gem 'cucumber-rails'
end

group :cucumber do
  gem 'capybara'
end

group :deployment do
  gem 'heroku'
end
