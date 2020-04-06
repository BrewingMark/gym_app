require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/fitness_class')
also_reload( '../models/*' )

get '/bookings' do
  erb( :"bookings/index" )
end
