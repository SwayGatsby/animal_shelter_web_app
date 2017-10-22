require_relative('../db/sql_runner.rb')

class Animal

  attr_reader(:id, :name, :type, :breed, :admission_date, :adoptable)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
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


end
