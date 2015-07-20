class Logo < ActiveRecord::Base
  belongs_to :sponsor
  validates :url, presence: true
  has_uploadcare_file :url
end
