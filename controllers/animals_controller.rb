require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

get '/animals/adoptable' do
  @animals = Animal.adoptable()
  erb (:"animals/adoptable")
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  redirect to '/animals'
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id].to_i())
  erb(:"animals/edit")
end

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update()
  redirect to '/animals'
end
