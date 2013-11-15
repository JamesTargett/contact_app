class Application
 
  def initialize
  end

  # Infinite loop to run menu and options
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
      elsif input.start_with?("delete")
        delete, @id = input.split
        input_delete
      else
        puts "Sorry, '#{input}' is not a valid response. Select again."
      end
    end
  end
  
  # Display the main menu
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new        - Create a new contact"
    puts " list       - List all contacts"
    puts " show :id   - Display contact details"
    puts " delete :id - Remove contact"
    puts " quit       - Exit the program"
    print "> "
  end

  # Add new contact
  def input_new
    puts "Email?"
    email = gets.chomp.downcase
      puts "Full name?"
      name = gets.chomp
      first_name, last_name = name.split
      puts "Occupation?"
      occupation = gets.chomp
      puts "How important is this person?"
      importance = gets.chomp
      contact = Contact.create(first_name: first_name, last_name: last_name, email: email, occupation: occupation, importance: importance)
      unless contact.valid?
        contact.errors.full_messages.each do |messages|
          puts messages
        end
      end
  end

  # List all contacts
  def input_list
    Contact.all.each_with_index do |contact, i|
      puts i.to_s << " : " << "#{contact.to_s}"
    end
  end

  # Show a contact via :id
  def input_show
    @id.to_i
    contact = Contact.find(@id)
    puts contact.to_s 
  end

  # Remove a contact
  def input_delete
    @id.to_i
    contact = Contact.find(@id)
    puts "Contact '#{contact.to_s}' removed from database."
    contact.destroy
  end

end