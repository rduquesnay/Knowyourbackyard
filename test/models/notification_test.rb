require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:message)
  should validate_presence_of(:link)
end
