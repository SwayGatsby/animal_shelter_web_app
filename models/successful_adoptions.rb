class SuccessfulAdoptions
  attr_reader(:first_name, :last_name, :type, :name, :adoption_date, :checkup_date)

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @type = options['type']
    @name = options['name']
    @adoption_date = options['adoption_date']
    @checkup_date = options['checkup_date']
  end

end
