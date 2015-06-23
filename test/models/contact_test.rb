require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  should validate_presence_of(:subject)
  should validate_presence_of(:message)
end
