require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/adoption.rb')

get '/adoptions' do
  @adoptions = Adoption.customers_that_adopted()
  erb (:"adoptions/index")
end
