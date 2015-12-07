require 'bcrypt'
class Account < ActiveRecord::Base

  include BCrypt #bzz bzz
  self.table_name = 'accounts'
  #setter for password
  # = sign is unnessary but has a subtle difference
  def password=(pwd)
    #set the password_digest column
    self.password_digest = Bcrypt::Password.create(pwd)
  end

  #getter for password
  #define method to return password
  def password
    BCrypt::Password.new(self.password_digest)
  end

  #create a method to test if we are allowed authorization
  #so we can authenticate
  def self.authenticate(user_name, password)
    #search for user
    #Account model.find_by column name with value to search
    current_user = Account.find_by(user_name: user_name)
    #return current user IF IF IF passwords match
    if(current_user.password == password)
      return current_user
    else
      return nil
    end

  end
end
