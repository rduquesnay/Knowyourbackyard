require 'test_helper'

class SocialTest < ActiveSupport::TestCase
  should belong_to(:user)
end
