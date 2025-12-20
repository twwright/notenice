source 'https://rubygems.org'

ruby "~> 3.3.x"

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'redcarpet'
gem 'coderay'
gem 'rack'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :development do
  gem "sqlite3", "~> 1.3.6"
  gem 'thin'
  gem 'shotgun'
  gem 'pry'
  gem 'tux'
end

group :production do
  gem 'pg', '~> 0.20'
  # SQLite3 also available in production as fallback
  gem "sqlite3", "~> 1.3.6"
end
