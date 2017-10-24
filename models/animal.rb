require('date')
require_relative('../db/sql_runner.rb')

class Animal

  attr_reader(:id, :name, :type, :breed, :admission_date, :adoptable)
  attr_writer(:name, :type, :breed, :admission_date, :adoptable)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = Date.parse(options['admission_date'])
    @adoptable = options['adoptable']

    #TODO: add picture - url not practical for good ux tho research other options
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      admission_date,
      adoptable
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @breed, @admission_date, @adoptable]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql, values)
    return Animal.new(animal[0])
  end


  def self.adoptable()
    sql = "SELECT * FROM animals
    WHERE adoptable"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|animal| Animal.new(animal)}
  end


  def is_adoptable?()
    if @adoptable == "t"
      return "Ready for adoption"
    else
      return "Not yet ready for adoption"
    end
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      type,
      breed,
      admission_date,
      adoptable
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @type, @breed, @admission_date, @adoptable, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def self.get_adopted_animals()
  #   sql = "SELECT * FROM animals INNER JOIN adoptions ON adoptions.animal_id = animals.id"
  # end

  # def get_unadopted_animals()

end
