require_relative('../db/sql_runner.rb')
require('pry')


class Adoption

  attr_reader(:id, :animal_id, :customer_id, :date_adopted, :checkup_date)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @animal_id = options['animal_id'].to_i()
    @customer_id = options['customer_id'].to_i()
    @date_adopted = Date.parse(options['date_adopted'])
    @checkup_date = Date.parse(options['checkup_date'])
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      customer_id,
      date_adopted,
      checkup_date
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@animal_id, @customer_id, @date_adopted, @checkup_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()

    # Animal record boolean needs to be set to false

    @id = results.first()['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|adoption| Adoption.new(adoption)}
  end

  def self.customers_that_adopted()
    sql = "SELECT customers.first_name, customers.last_name, animals.name, animals.type, adoptions.date_adopted, adoptions.checkup_date
    FROM customers
    INNER JOIN adoptions
    ON adoptions.customer_id = customers.id
    INNER JOIN animals
    ON animals.id = adoptions.animal_id"
    values = []
    results = SqlRunner.run(sql, values)
    results.map{|result| SuccessfulAdoptions.new(result)}
  end



end
