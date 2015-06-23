require 'test_helper'

class RevisionreviewTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:revision)
  should have_one(:revisiondispute)
end
