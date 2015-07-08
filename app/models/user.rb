class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  has_many :campaigns
  has_many :items

  def admin?
    role == 'admin'
  end
end
