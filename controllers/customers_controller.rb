require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')

get '/customers' do
  erb(:"customers/index")
end

get '/customers/all' do
  @customers = Customer.all()
  erb(:"customers/show")
end

get '/customers/new' do
  erb(:"customers/new")
end

post '/customers' do
  @customer = Customer.new(params)
  @customer.save()
  redirect to '/customers/all'
end


#
# get '/customers/:id/edit' do
#   @customer = Customer.find(params[:id])
#   erb(:"customer/edit")
# end
