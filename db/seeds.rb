require('pry')
require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/adoption.rb')
require_relative('../models/successful_adoptions.rb')


animal_1 = Animal.new({
  'name' => 'Agent Cooper',
  'type' => 'Dog',
  'breed' => 'Labrador Retriever',
  'admission_date' => '22/09/2017',
  'adoptable' => true
  })

animal_1.save()

animal_2 = Animal.new({
  'name' => 'Blue Rose',
  'type' => 'Dog',
  'breed' => 'Irish Wolfhound',
  'admission_date' => '22/09/2017',
  'adoptable' => false
  })

animal_2.save()

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

adoption_1 = Adoption.new({
  'animal_id' => animal_1.id,
  'customer_id' => customer_1.id,
  'date_adopted' => '10/10/2017',
  'checkup_date' => '10/12/2017'
  })

adoption_1.save()



binding.pry
nil
