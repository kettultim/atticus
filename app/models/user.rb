class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :campaigns

  def admin?
    role == "admin"
  end
end
