class User < ActiveRecord::Base
  has_secure_password
  validate :wedding_password_is_correct
  validates :email, {presence: true, uniqueness: true }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, length: {minimum: 8}

  def wedding_password
    @wedding_password
  end

  def wedding_password=(wedding_password)
    @wedding_password = wedding_password
  end

  private

  def wedding_password_is_correct
    errors[:wedding_password] << "is incorrect" unless wedding_password == "ellieandnick2015"
  end
end