require './app'

def print_menu
  puts 'Please choose an option by enterin a number'
  puts '1 → List all books'
  puts '2 → List all people'
  puts '3 → Create a person'
  puts '4 → Create a book'
  puts '5 → Create a rental'
  puts '6 → List all rentals for a given person id'
  puts '7 → Exit'
  @choise = gets.chomp
end

def main
  app = App.new
  loop do
    print_menu
    case @choise
    when '1'
      app.list('book')
    when '2'
      data.list('person')
    when '3'
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      selection = gets.chomp
      case selection
      when '1'
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        print 'Classroom: '
        classroom = gets.chomp
        print 'Has parent permission? [Y/N]: '
        permission = gets.chomp
        loop do
          break if permission.capitalize == 'N' || permission.capitalize == 'Y'

          puts "#{permission} is not a valid entry, try again"
          permission = gets.chomp
        end
        app.add_student(classroom, age, name, permission)
      when '2'
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        print 'Specialization: '
        specialization = gets.chomp
        app.add_teacher(specialization, age, name)
      end
    when '4'
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.add_book(title, author)
    when '5'
      if app.books.empty? || app.person.empty?
        puts 'There are no books or people added'
      else
        puts 'Select a book from the following list by number'
        app.list('book')
        option = gets.chomp.to_i
        # book1 = data.book.map.with_index { |b, i| b.title if i == option }
        book = data.books[option - 1]
        puts 'Select a person from the following list by number (not id)'
        app.list('people')
        choose = gets.chomp.to_i
        person = data.persons[choose - 1]
        print 'Date [YYYY/MM/DD]: '
        date = gets.chomp
        app.add_rental(date, book, person)
      end
    when '6'
      print "person's ID: "
      id = gets.chomp.to_i
      record = app.person.filter_map do |i|
        i.name if i.id == id
      end
      loop do
        break if record.length.positive? || id.zero?

        puts "Invalid ID #{id}, please try again"
        puts 'Or go back to the main menu by pressin 0'
        id = gets.chomp.to_i
        record = app.person.filter_map do |i|
          i.name if i.id == id
        end
      end
      value = record.join
      app.rental_list(value)
    when '7'
      puts 'Thank you for using the app!'
      break

    else
      puts "option #{@choise} is invalid, please try againt \n"
    end
  end
end

main
