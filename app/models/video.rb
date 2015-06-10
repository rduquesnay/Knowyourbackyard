class Video < ActiveRecord::Base
  belongs_to :trail
  validates :src, presence: true
end
