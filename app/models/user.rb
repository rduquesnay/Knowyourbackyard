class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_many :trails
  has_many :comments
  has_many :trailupdates
  has_many :reviews
  has_many :revisions
  has_many :notifications
  belongs_to :chat
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  validates :username, :email, :password, :firstname, :lastname, :country, presence: true
  validates :username, uniqueness: {:case_sensitive => false} 
  after_update :send_promote_notification, :if => proc{points_changed? && points >=1400 && points_was <1400 && !trailblazer && !demoted}

  scope :trailblazer, -> {where(trailblazer: true)}
  scope :admin, -> {where(admin: true)}
  scope :trekker, -> {where(trailblazer: false)}
  scope :topusers, -> {order(points: :desc).limit(15)}
  scope :original, -> {where(original_trailblazer: true)}


  def send_promote_notification
    note = Notification.new(message: "You have been invited to become a Trailblazer.", link: "<a data-method=\"patch\" href=\"\/PromoteTrailblazer\" id=\"#{id}\">Accept<\/a>", user_id: id)
    note.save
  end
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
