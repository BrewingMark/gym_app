require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/fitness_class')
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb( :"bookings/index" )
end

post '/bookings/:id/delete' do
  id = params['id'].to_i()
  Booking.delete(id)
  redirect to ('/bookings')
end
