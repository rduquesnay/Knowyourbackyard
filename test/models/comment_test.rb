require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should belong_to(:user)
end
