class Resolvedrevisiondispute < ActiveRecord::Base
  belongs_to :trail
  has_uploadcare_group :revisied_photos
end
