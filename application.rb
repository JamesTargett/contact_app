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
        new_contact
      elsif input == "list"
        list_contact
      elsif input.start_with?("show")
        show, id = input.split
        show_contact(id)
      elsif input.start_with?("delete")
        delete, id = input.split
        delete_contact(id)
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
  def new_contact
    puts "Email?"
    email = gets.chomp.downcase
      puts "Full name?"
      name = gets.chomp
      first_name, last_name = name.split
      puts "Occupation?"
      occupation = gets.chomp
      puts "How important is this person?"
      importance = gets.chomp
      contact = Contact.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        occupation: occupation,
        importance: importance
      )
      unless contact.valid?
        contact.errors.full_messages.each do |messages|
          puts messages
        end
      end
  end

  # List all contacts
  def list_contact
    Contact.all.each_with_index do |contact, i|
      puts i.to_s << " : " << "#{contact.to_s}"
    end
  end

  # Show a contact via :id
  def show_contact(id)
    contact = Contact.find(id)
    puts contact.to_s 
  end

  # Remove a contact
  def delete_contact(id)
    contact = Contact.find(id)
    puts "Contact '#{contact.to_s}' removed from database."
    contact.destroy
  end

end