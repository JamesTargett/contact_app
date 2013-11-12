class Contact
  
  attr_accessor :name
  attr_accessor :email

  def initialize(name, email)
    @name = name
    @email = email
  end
  
  # Return string representation of Contact
  def to_s
    " : #{name} (#{email})"
  end
  
end