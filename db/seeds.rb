require('pry')
require_relative('../models/animal.rb')
require_relative('../models/customer.rb')


animal_1 = Animal.new({
  'name' => 'Agent Cooper',
  'type' => 'Dog',
  'breed' => 'Labrador Retriever',
  'admission_date' => '2017-10-22',
  'adoptable' => true
  })

animal_1.save()

customer_1 = Customer.new({
  'first_name' => 'Kayla',
  'last_name' => 'Fowler',
  'phone' => '01315555555',
  'email' => 'kayla@email.com',
  'address_line_1' => 'Flat 404',
  'address_line_2' => '30 Long Road',
  'address_city' => 'Edinburgh',
  'address_post_code' => 'EH1 1XX'
  })

  customer_1.save()

binding.pry
nil
