require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should belong_to(:user)
  should have_one(:reviewdispute)
end
