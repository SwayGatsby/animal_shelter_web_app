require('pry')
require_relative('../models/animal.rb')

animal_1 = Animal.new({
  'name' => 'Agent Cooper',
  'type' => 'Dog',
  'breed' => 'Labrador Retriever',
  'admission_date' => '2017-10-22',
  'adoptable' => true
  })

animal_1.save()

Animal.all()


binding.pry
nil
