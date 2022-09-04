require './nameable'
require './rental.rb'
class Person < Nameable
  attr_reader :id
  attr_accessor :age, :namem :rentals

  def initialize(age, name = 'Unknown', parent_permision: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permision = parent_permision
    rentals = []
  end

  def can_use_services?
    of_age? || parent_permision
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age > 17
  end
end
