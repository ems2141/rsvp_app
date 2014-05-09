class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :wedding_password_is_correct

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