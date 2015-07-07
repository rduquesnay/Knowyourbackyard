class Image < ActiveRecord::Base
  belongs_to :trail
  has_uploadcare_file :url

  scope :accepted, -> { where(accepted: true)}
end
