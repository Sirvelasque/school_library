require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
