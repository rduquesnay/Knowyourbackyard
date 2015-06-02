class Review < ActiveRecord::Base
  belongs_to :trail
  belongs_to :user
  has_one :reviewdispute
end
