require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller')
require_relative('controllers/members_controller')
require_relative('controllers/fitness_classes_controller')

get '/' do
  erb( :index )
end
