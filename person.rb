class Person
  attr_reader :id
  attr_accessor :age, :name

  def initialize(age, name = 'Unknown', parent_permision: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  private

  def of_age?
    age > 17
  end

  def can_use_services?
    of_age? || parent_permision
  end
end
