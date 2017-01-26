# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!

class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note, :date

  @@contacts = []

  @@next_id = 1


  def first_name
    @first_name
  end

  def first_name=(update)
    @first_name = update
  end


  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note, date)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @date = date
    @@next_id +=1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note, date)

    new_contact = self.new(first_name, last_name, email, note, date)

    @@contacts << new_contact

    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      return contact if contact.id == id
    end
    return false
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  #$frank.update(:first_name, "John")


  def update(attribute, new_value)

    case attribute.to_sym
    when :first_name
      self.first_name = new_value
    when :last_name
      self.last_name = new_value
    when :email
      self.email = new_value
    when :note
      self.note = new_value
    when :date
      self.date = new_value

    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by (attribute, value)
    @@contacts.each do |contact|
    return contact if attribute.to_sym == :first_name && contact.first_name == value
    return contact if attribute.to_sym == :last_name && contact.last_name == value
    return contact if attribute.to_sym == :email && contact.email == value
    return contact if attribute.to_sym == :note && contact.note == value
    return contact if attribute.to_sym == :date && contact.date == value



    #what is potential escape if nothing is found.
    end
    return false
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear

  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.
  def display_contact
    puts
    puts:"=============================="
    puts "First name: #{@first_name}"
    puts "Last name: #{@last_name}"
    puts "Email: #{@email}"
    puts "Note: #{@note}"
    puts "Id: #{@id}"
    puts "Date:#{@date}"
    puts "==============================="
  end




end
