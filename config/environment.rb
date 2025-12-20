require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= ENV['RACK_ENV'] || "development"

configure :development do
  require 'bundler/setup'

  Bundler.require(:default, ENV['SINATRA_ENV'])

  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
  require 'bundler/setup'
  
  # Check if DATABASE_URL is provided (for PostgreSQL on Vercel/Heroku)
  if ENV['DATABASE_URL']
    db = URI.parse(ENV['DATABASE_URL'])
    
    ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
    )
  else
    # Fallback to SQLite for production if no DATABASE_URL is set
    # Note: You should set up a PostgreSQL database for production
    ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "db/production.sqlite"
    )
  end
end

require './app/controllers/application_controller'
require_all 'app'
