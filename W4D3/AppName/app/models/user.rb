require 'SecureRandom'

class User < ApplicationRecord

  validates :username, presence: true
  validates :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def self.ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password= (pass)
    @password = BCrypt::Password.new(pass)
    self.password_digest = @password
  end
end
