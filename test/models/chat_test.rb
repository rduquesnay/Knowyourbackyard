require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  should have_many(:messages)
end
