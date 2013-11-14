class Application
 
  def initialize
  end

  # Infinite loop that runs main menu and options.
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
      elsif input == "importance"
        input_importance
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
  
  # Displays the main menu
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new        - Create a new contact"
    puts " list       - List all contacts"
    puts " importance - List contacts by importance"
    puts " show :id   - Display contact details"
    puts " delete :id - Remove contact"
    puts " quit       - Exit the program"
    print "> "
  end

  # Collect input and add to ActiveRecord
  def input_new
    puts "Email?"
    email = gets.chomp.downcase
    if Contact.all.detect { |c| c.email == email }
      puts "That contact already exists and cannot be created."
    else
      puts "Full name?"
      name = gets.chomp
      first_name, last_name = name.split
      puts "Occupation?"
      occupation = gets.chomp
      puts "How important is this person?"
      importance = gets.chomp
      contact = Contact.create(first_name: first_name, last_name: last_name, email: email, occupation: occupation, importance: importance)
    end
  end

  def input_show
    @id.to_i
    contact = Contact.find(@id)
    puts contact.to_s 
  end

  def input_delete
    @id.to_i
    contact = Contact.find(@id)
    puts "Contact '#{contact.to_s}' removed from database."
    contact.destroy
  end

  # Return list of Contacts in ActiveRecord::Base
  # def input_list
  #  Contact.all.each_with_index do |contact, i|
  #    puts i.to_s << " : " << "#{contact.to_s}"
  #  end
  # end

end