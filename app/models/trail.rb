class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :trailupdates, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :ratings

end
