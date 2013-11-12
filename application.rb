class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = []
  end
 
  def run
    show_main_menu
    input = gets.chomp
    if input == "quit"
      puts "See ya."
      exit
    elsif input == "new"
      puts "Full name?"
      name = gets.chomp
      puts "Email?"
      email = gets.chomp
      # is this doable? pushing an object of the Contact class into the array without being saved as a variable?
      @contacts << Contact.new(name, email)
      run
    elsif input == "list"
      # if the @contacts array contains objects of the class Contact, shouldn't we be able to call the to_s method on each object in the array?
      @contacts.each do |entry|
        entry.to_s
      end

    # elsif input == "show #{:id}"
        
    else
      puts "Sorry, '#{input}' is not a valid response. Select again."
      run
    end
  end
  
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    print "> "
  end

end