class Advertiser < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :phone, length: { minimum: 8}, allow_blank: true
  validates_format_of :email, {with: VALID_EMAIL_REGEX}
end
