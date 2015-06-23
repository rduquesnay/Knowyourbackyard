require 'test_helper'

class TrailupdateTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should belong_to(:user)

end
