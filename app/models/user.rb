class User < ActiveRecord::Base
  has_many :trails
  has_many :comments
  has_many :trailupdates
  has_many :reviews
  has_many :revisions
  has_many :notifications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  validates :username, :email, :password, :firstname, :lastname, :country, presence: true

  scope :trailblazer, -> {where(trailblazer: true)}
  scope :admin, -> {where(admin: true)}
  scope :trekker, -> {where(trailblazer: false)}
  scope :topusers, -> {order(points: :desc).limit(10)}

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    where(conditions).first
  end
  end
end
