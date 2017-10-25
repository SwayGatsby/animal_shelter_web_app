require('date')
require_relative('../db/sql_runner.rb')

class Animal

  attr_reader(:id, :name, :type, :breed, :admission_date, :adoptable, :photo)
  attr_writer(:name, :type, :breed, :admission_date, :adoptable, :photo)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @photo = options['photo'] if options['photo']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = Date.parse(options['admission_date'])
    @adoptable = options['adoptable']
  end

  def save()
    sql = "INSERT INTO animals
    (
      photo,
      name,
      type,
      breed,
      admission_date,
      adoptable
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@photo, @name, @type, @breed, @admission_date, @adoptable]
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
    WHERE adoptable is true"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|animal| Animal.new(animal)}
  end

  def is_adoptable?()
    if @adoptable == "t"
      return "Yes"
    else
      return "No"
    end
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      photo,
      name,
      type,
      breed,
      admission_date,
      adoptable
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@photo, @name, @type, @breed, @admission_date, @adoptable, @id]
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

  def self.get_unadopted_animals()
    # sql = "SELECT * FROM animals
    sql = "SELECT animals.id, animals.photo,
      animals.name, animals.type, animals.breed,
      animals.admission_date, animals.adoptable
    FROM animals
    LEFT JOIN adoptions
    ON adoptions.animal_id = animals.id
    WHERE adoptions.id is NULL"
    values = []
    results = SqlRunner.run(sql,values)
    return results.map{|animal| Animal.new(animal)}
  end


end
