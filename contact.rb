class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  

  def initialize(name, email)
    @first_name, @last_name = name.split
    @email = email
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # def namesplitter
  #   @name.split(" ")
  #   @first_name = name
  #   @last_name = name[1]
  # end
  
  # Return string representation of Contact
  def to_s
    " : #{first_name} #{last_name} (#{email})"
  end
  
end