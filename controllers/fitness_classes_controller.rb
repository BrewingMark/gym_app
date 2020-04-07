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

post '/fitness_classes' do
  fitness_class = FitnessClass.new(params)
  fitness_class.save
  redirect to("/fitness_classes")
end

post '/fitness_classes/:id/delete' do
  id = params['id'].to_i()
  FitnessClass.delete(id)
  redirect to ('/fitness_classes')
end

get '/fitness_classes/:id' do
  @fitness_class = FitnessClass.find(params['id'].to_i)
  erb( :"fitness_classes/show")
end
