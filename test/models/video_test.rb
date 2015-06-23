require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  should belong_to(:trail)
  should validate_presence_of(:src)
end
