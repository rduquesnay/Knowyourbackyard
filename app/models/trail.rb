class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :trailupdates
  has_many :ratings
  has_many :comments
  has_many :reviews
  has_many :revisions
  has_one :video
  has_many :video_submissions
  accepts_nested_attributes_for :ratings, allow_destroy: true
  has_uploadcare_group :images

  scope :accepted, -> { where(status: "Accepted" )}
  scope :unreviewed, -> {where(status: "To be reviewed")}
  scope :reviewing, -> {where(status: "Under review")}
  scope :hiking, -> {where(trailtype: "Hiking")}
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
  def self.searchname(search)
    where("name LIKE ?", "%#{search}%")
  end
  def self.searchlocation(search)
    where("location LIKE ?", "%#{search}%")
  end
end
