class User < ActiveRecord::Base
  has_many :trails
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  validates :username, :email, :password, :firstname, :lastname, :country, presence: true

end
