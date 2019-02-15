require 'openssl'

class User < ApplicationRecord
  attr_accessor :password

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A(@*[A-Z]*[a-z]*\w*)\z/

  has_many :questions

  validates :email, presence: true, uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true,
            format: { with: VALID_USERNAME_REGEX }, length: { maximum: 40 }
  before_save { self.username = username.downcase }

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save { self.email = email.downcase }
  before_save :encrypt_password

  def encrypt_password
    if self.password.present?

      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length,DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS,DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
