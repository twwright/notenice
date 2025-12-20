#!/usr/bin/env ruby
# This script sets up the production database if DATABASE_URL is set

if ENV['DATABASE_URL']
  require 'uri'
  require 'pg'
  
  db = URI.parse(ENV['DATABASE_URL'])
  
  begin
    # Connect to database
    conn = PG.connect(
      host: db.host,
      port: db.port || 5432,
      dbname: db.path[1..-1],
      user: db.user,
      password: db.password,
      sslmode: 'require'
    )
    
    puts "✓ Connected to database"
    
    # Check if tables exist
    result = conn.exec("SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'users')")
    
    if result[0]['exists'] == 'f'
      puts "Running migrations..."
      
      # Create users table
      conn.exec("
        CREATE TABLE users (
          id SERIAL PRIMARY KEY,
          username VARCHAR(255) NOT NULL UNIQUE,
          email VARCHAR(255),
          password_digest VARCHAR(255) NOT NULL,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
      ")
      puts "✓ Created users table"
      
      # Create notes table
      conn.exec("
        CREATE TABLE notes (
          id SERIAL PRIMARY KEY,
          topic VARCHAR(255),
          content TEXT,
          user_id INTEGER REFERENCES users(id),
          public BOOLEAN DEFAULT false,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
      ")
      puts "✓ Created notes table"
      
      puts "✓ Database setup complete!"
    else
      puts "✓ Database already set up"
    end
    
    conn.close
  rescue => e
    puts "Error: #{e.message}"
    exit 1
  end
else
  puts "No DATABASE_URL set, skipping production database setup"
end

