require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.get_unadopted_animals()
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
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end


post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end


# get '/animals/in_shelter' do
#   @animals = Animal.get_unadopted_animals
#   erb(:"animals/in_shelter")
# end
