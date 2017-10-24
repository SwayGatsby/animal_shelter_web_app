require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')

get '/customers/adopted' do
  @customers = Animal.adoptable()
  erb (:"animals/adoptable")
end
