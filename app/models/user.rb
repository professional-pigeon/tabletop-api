require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  has_secure_password
  has_many :campaigns
  
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def auth(password)
    self.password == password
  end
end
