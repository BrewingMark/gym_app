require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/fitness_class')
also_reload( '../models/*' )

get '/fitness_classes' do
  @fitness_classes = FitnessClass.all
  erb( :"fitness_classes/index" )
end

get '/fitness_classes/new' do
  erb( :"/fitness_classes/new")
end

get '/fitness_classes/:id' do
  @fitness_class = FitnessClass.find(params['id'].to_i)
  erb( :"fitness_classes/show")
end
