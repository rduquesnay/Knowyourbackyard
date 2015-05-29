class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :trailupdates, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :ratings, allow_destroy: true

  scope :accepted, -> { where(status: "Accepted" )}
  scope :unreviewed, -> {where(status: "To be reviewed")}
  scope :reviewing, -> {where(status: "Under review")}
  scope :revision, -> {where(status: "Under revsion")}
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
