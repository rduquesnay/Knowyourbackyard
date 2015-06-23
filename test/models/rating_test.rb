require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should validate_presence_of(:difficulty)
  should validate_presence_of(:durationinsec)
  should validate_numericality_of(:difficulty).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
  should validate_numericality_of(:durationinsec).only_integer.is_greater_than_or_equal_to(1)
end
