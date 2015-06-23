require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:chat)
end
