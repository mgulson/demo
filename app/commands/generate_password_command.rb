require 'bcrypt'

class GeneratePasswordCommand
  def process(password)
    @password = password
    hash_password
  end
  
  def hash_password
    BCrypt::Password.create(@password)
  end
  
  def verify_password(password, hashed_password)
    BCrypt::Password.new(hashed_password) == password
  end
end