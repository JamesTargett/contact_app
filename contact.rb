class Contact
  
  attr_accessor :name
  attr_accessor :email
  
  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
  
  def to_s
    # TODO: return string representation of Contact
    puts "#{@contacts.length}: #{name} (#{email}"
  end
  
end