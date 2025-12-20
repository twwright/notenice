require './config/environment'
require './app'

# Skip migration check in production (Vercel)
if ENV['RACK_ENV'] != 'production' && defined?(ActiveRecord::Migrator)
  if ActiveRecord::Migrator.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end
end

use Rack::MethodOverride

use NotesController
use UsersController
run ApplicationController
