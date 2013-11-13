class Application
 
  def initialize
    # Start with an empty array of contacts.
    @contacts = [ 
      Contact.new("Scott Summers", "ssummers@gmail.com"), 
      Contact.new("Peter Parker", "peterparkersciencenerd@gmail.com") 
    ]
  end

  # Run through an infinite loop that displays the main menu/interface.
  def run
    loop do
      show_main_menu
      input = gets.chomp
      if input == "quit"
        puts "See ya."
        exit
      elsif input == "new"
        input_new
      elsif input == "list"
        input_list
      elsif input.start_with?("show")
        show, @id = input.split
        input_show
      else
        puts "Sorry, '#{input}' is not a valid response. Select again."
      end
    end
  end
  
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    puts " quit     - Exit the program"
    print "> "
  end

  # Collect input and push it to the @contacts array
  def input_new
    puts "Email?"
    email = gets.chomp.downcase
    if @contacts.detect { |c| c.email == email }
      puts "That contact already exists and cannot be created."
    else
      puts "Full name?"
      name = gets.chomp
      @contacts << Contact.new(name, email)
    end
  end

  # Return index of Object in Array, change it into a string and concatenate with the Object (of Contact class) having called it's to_s method
  def input_list
    @contacts.each_with_index do |contact, i|
      puts i.to_s << " : " << "#{contact.to_s}"
    end
  end

  def input_show
    if @id.to_i <= @contacts.length
    puts @contacts[@id.to_i]
    else 
      puts "Contact not found."
    end
  end

end