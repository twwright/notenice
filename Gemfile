source 'http://rubygems.org'

ruby '3.1.6'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'redcarpet'
gem 'coderay'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :development do
  gem "sqlite3", "~> 1.3.6"
end

group :production do
  gem 'pg', '~> 0.20'
end
