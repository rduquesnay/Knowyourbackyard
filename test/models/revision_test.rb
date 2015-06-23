require 'test_helper'

class RevisionTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should belong_to(:user)
  should have_many(:revisionreviews)
end
