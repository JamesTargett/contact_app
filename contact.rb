class Contact < ActiveRecord::Base

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :occupation, presence: true
  validates :importance, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }

  # Return string representation of Contact
  def to_s
  "#{first_name} #{last_name} - #{occupation} (#{email})"
  end
  
end