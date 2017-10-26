require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
  erb(:"animals/index")
end

get '/animals/all' do
  # Use get_unadopted_animals to return animals from adoptions table that are cross-referenced with adoptions table & only returning those who are not on the adoptions table.
  #BUG: This will create problems with animals that have been adopted and returned to the shelter.
  @animals = Animal.get_unadopted_animals()
  erb (:"animals/show")
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
  redirect to '/animals/all'
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end
