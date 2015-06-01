class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :trailupdates
  has_many :ratings
  has_many :comments
  has_many :reviews
  has_many :revisions
  accepts_nested_attributes_for :ratings, allow_destroy: true

  scope :accepted, -> { where(status: "Accepted" )}
  scope :unreviewed, -> {where(status: "To be reviewed")}
  scope :reviewing, -> {where(status: "Under review")}
  scope :disputed, -> {where(status: "Under dispute")}
end
