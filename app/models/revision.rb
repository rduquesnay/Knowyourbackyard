class Revision < ActiveRecord::Base
  belongs_to :trail
  belongs_to :user
  has_many :revisionreviews
  has_uploadcare_group :images
end
