require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def own_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
