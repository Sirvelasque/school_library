require './person'
require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_reader :persons, :books, :rentals

  def initialize
    @person = []
    @books = []
    @rentals = []
  end

  def add_student(classroom, age, name, _permission)
    @persons << Student.new(classroom, age, name)
    puts 'Person created successfully'
  end

  def add_teacher(specialization, age, name)
    @persons << Teacher.new(specialization, age, name)
    puts 'Person create succesfully'
  end

  def add_book(title, author)
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def add_rental(date, book, person)
    @rentals << Rental.new(date, @books[book - 1], @persons[person - 1])
    puts 'Rental created successfully'
  end

  def list(option)
    case option
    when 'book'
      if @books.empty?
        puts 'We have no books yet'
      else
        @books.map.with_index do |book, index|
          puts "#{index}) Title: #{book.title}, Author: #{book.author}"
        end
      end
    when 'person'
      if @persons.empty?
        puts 'There is no people suscribed yet'
      else
        @person.map.with_index do |val, index|
          puts "#{index}) Name: #{val.name}, ID: #{val.id}, Age: #{val.age}"
        end
      end
    end
  end

  def rental_list(id)
    puts "ID of person: #{id}"
    @persons.each do |person|
      next unless person.id == id

      puts 'Rentals:'
      person.rentals.each_with_index do |item, i|
        puts " #{i}) Date: #{item.date}, Book: #{item.book.title} writed by #{item.book.author}"
      end
    end
  end
end
