require_relative('../db/sql_runner.rb')


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
  end

end
