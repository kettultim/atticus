class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def admin?
    role == "admin"
  end
end
