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
  scope :revision, -> {where(status: "Under revision")}
  scope :disputed, -> {where(status: "Under dispute")}

  protected
  def self.accept_trail
   self.status = "Accepted" 
  end
  def self.reviewing_trail
   self.status = "Under review" 
  end
  def self.revisiong_trail
   self.status = "Under revision" 
  end
  def self.dispute_trail
   self.status = "Under dispute" 
  end
end
