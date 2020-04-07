require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/member')
also_reload( '../models/*' )



get '/members' do
  @members = Member.all()
  erb( :"members/index" )
end

get '/members/new' do
  erb( :"members/new")
end

post '/members/:id/delete' do
  id = params['id'].to_i()
  Member.delete(id)
  redirect to ('/members')
end

get '/members/:id/update' do
  id = params['id'].to_i
  @member = Member.find(id)
  erb( :"members/update")
end

post '/members/:id' do
  member = Member.new(params)
  member.update()
  redirect to ('/members/' + params['id'])
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/show")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end
