class User < ActiveRecord::Base
  has_secure_password
  validates :email, {presence: true, uniqueness: true }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, length: {minimum: 8}
end