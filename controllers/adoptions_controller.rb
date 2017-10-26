require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/adoption.rb')
require_relative('../models/successful_adoptions.rb')

get '/adoptions' do
  erb (:"adoptions/index")
end

get '/adoptions/all' do
  # Use method created to turn SQL query results into usable objects
  @adoptions = Adoption.customers_that_adopted
  erb(:"adoptions/show")
end

get '/adoptions/new' do
  erb(:"adoptions/new")
end

post '/adoptions' do
  adopted_animal = Animal.find(params['animal_id'].to_i())
  # TODO: Need to remove from controller and put in model.
    if (adopted_animal.adoptable == "t")
      # Mark animal as no longer adoptable
      adopted_animal.adoptable = false
      adopted_animal.update()
      # Create new adoption record
      @adoption = Adoption.new(params)
      @adoption.save()
    else
      # The animal is not adoptable
      # TODO: Show an error page or similar. This requires sessions and will be included in a later iteration.
    end
  redirect "adoptions/all"
end
