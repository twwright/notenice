source 'https://rubygems.org'

ruby "~> 3.3.x"

gem 'sinatra', '~> 3.0'
gem 'activerecord', '~> 7.0'
gem 'sinatra-activerecord', '~> 2.0'
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'redcarpet'
gem 'coderay'
gem 'rack'
gem 'puma'

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner-active_record'
end

group :development do
  gem "sqlite3", "~> 1.7"
  gem 'pry'
end

group :production do
  gem 'pg', '~> 1.5'
end
