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
    # Fallback to in-memory SQLite for production if no DATABASE_URL is set
    # WARNING: This is temporary storage only - data will be lost on each deployment
    # Set up a PostgreSQL database and configure DATABASE_URL for persistent storage
    ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => ":memory:"
    )
    
    # Auto-run migrations for in-memory database
    require_relative '../db/migrate/20200413182411_create_users.rb'
    require_relative '../db/migrate/20200413182426_create_notes.rb'
    require_relative '../db/migrate/20200420023335_add_public_to_notes.rb'
    
    CreateUsers.new.change
    CreateNotes.new.change
    AddPublicToNotes.new.change
  end
end

require './app/controllers/application_controller'
require_all 'app'
