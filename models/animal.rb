require('date')
require_relative('../db/sql_runner.rb')

class Animal

  attr_reader(:id, :name, :type, :breed, :admission_date, :adoptable)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = Date.parse(options['admission_date'])
    @adoptable = options['adoptable']
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

  def self.find()
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results[0])
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

end
