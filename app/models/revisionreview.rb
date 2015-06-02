class Revisionreview < ActiveRecord::Base
  belongs_to :user
  belongs_to :revision
  has_one :revisiondispute
end
