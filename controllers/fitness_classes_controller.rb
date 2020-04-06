require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/fitness_class')
also_reload( '../models/*' )

get '/fitness_classes' do
  erb( :"fitness_classes/index" )
end
