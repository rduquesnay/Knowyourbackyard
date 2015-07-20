class Image < ActiveRecord::Base
  belongs_to :trail
  validates :url, presence: true
  has_uploadcare_file :url

  scope :accepted, -> { where(accepted: true)}
end
