require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end
require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/board_controller'
require_relative 'app/controllers/user_controller'



use BoardController
use  UserController
run ApplicationController



