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
  scope :hikking, -> {where(trailtype: "Hiking")}
  scope :aquatic, -> {where(trailtype: ["Kayaking/Canoeing", "Adventure Kayaking"])}


  def set_averages
    ratings = Rating.where(trail_id: self.id)
    diffsum = 0
    durasum = 0
    ratings.each do |rate|
      diffsum = diffsum + rate.difficulty
      durasum = durasum + rate.durationinsec
    end
    self.avgdifficulty = diffsum/ratings.count
    self.avgduration = durasum/ratings.count
    save
  end
end
