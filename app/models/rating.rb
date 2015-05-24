class Rating < ActiveRecord::Base
  belongs_to :trail
  validates :difficulty, :durationinsec, presence: true
  validates :difficulty, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :durationinsec, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
