class Contact < ActiveRecord::Base

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name,  presence: true

  def full_name
    "#{@first_name} #{@last_name}"
  end

  #def last_name_initial
  #  @last_name_initial = @last_name[0]
  # end
  
  # Return string representation of Contact
   def to_s
    "#{first_name} #{last_name} - #{occupation} (#{email})"
   end
  
end