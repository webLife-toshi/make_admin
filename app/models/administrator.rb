class Administrator < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  before_save :encrypt_password
  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
